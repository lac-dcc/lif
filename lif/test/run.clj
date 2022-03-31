(require '[babashka.fs :as fs]
         '[clojure.java.shell :as shell]
         '[clojure.string :as str])

(load-file "cli.clj")
(declare parse-cli)

(load-file "compile.clj")
(declare emit-asm)
(declare emit-bin)
(declare emit-llvm)
(declare llvm-link)
(declare lif)
(declare opt)

(load-file "ansi.clj")
(declare with-color)

(defn make-output-dirs [benchmark]
  (mapv (comp second (juxt fs/delete-tree fs/create-dirs))
        (map #(fs/path benchmark %) ["asm" "bin" "llvm-ir"])))

(defn files-by-ext [dir ext] (fs/glob dir (str "*." ext)))
(defn relativize->str [this] (comp str #(fs/relativize this %)))

(defn llvm-out->src [llvm-ir src]
  (->> src fs/file-name fs/strip-ext (fs/path llvm-ir) (#(str % ".ll"))))

(defn with-ctgrind [src]
  (let [[filepath ext] (fs/split-ext src)
        ext-with-separator (if (str/blank? ext) "" (str "." ext))]
    (str filepath ".ctgrind" ext-with-separator)))

;; TODO: move to another file
(defn branch-on-secret? [command input]
  (let [substr "conditional jump or move depends on uninitialised value(s)"]
    ;; TODO: handle errors (exit != 0)
    (-> (shell/sh "valgrind" command :in input)
        :err str/lower-case (str/includes? substr))))

(defn apply-lif [benchmark]
  (let [;; Create the output dirs if they don't exist:
        [asm bin llvm-ir] (map (relativize->str benchmark)
                               (make-output-dirs benchmark))
        ;; Get the list of lib files as str:
        libs (map (relativize->str benchmark)
                  (files-by-ext (fs/path benchmark "lib") "c"))
        ;; Get the list of src files as str:
        srcs (map (relativize->str benchmark)
                  (files-by-ext (fs/path benchmark "src") "c"))
        ;; Get the name of the llvm files:
        libs-llvm (map #(llvm-out->src llvm-ir %) libs)
        srcs-llvm (map #(llvm-out->src llvm-ir %) srcs)
        base-llvm (str llvm-ir fs/file-separator "base.ll")
        opt-llvm (str llvm-ir fs/file-separator "opt.ll")
        lif-llvm (str llvm-ir fs/file-separator "lif.ll")
        lifopt-llvm (str llvm-ir fs/file-separator "lifopt.ll")
        ;; Get the name of the asm files:
        base-asm (str asm fs/file-separator "base.s")
        opt-asm (str asm fs/file-separator "opt.s")
        lif-asm (str asm fs/file-separator "lif.s")
        lifopt-asm (str asm fs/file-separator "lifopt.s")
        ;; Get the name of the binary files:
        base-bin (str bin fs/file-separator "base")
        opt-bin (str bin fs/file-separator "opt")
        lif-bin (str bin fs/file-separator "lif")
        lifopt-bin (str bin fs/file-separator "lifopt")]
    (shell/with-sh-dir benchmark
      (println "Compiling" benchmark "...")
      ;; Emit the llvm intermediate files:
      (dorun (pmap #(emit-llvm
                     %1 %2
                     ;; "-DENABLE_MEASURE_TIME"
                     "-fno-discard-value-names")
                   (concat libs srcs) (concat libs-llvm srcs-llvm)))
      ;; Emit code with ctgrind enabled:
      (dorun (pmap #(emit-llvm
                     %1 %2
                     "-fno-discard-value-names"
                     "-DENABLE_CTGRIND")
                   srcs (map with-ctgrind srcs-llvm)))
      ;; Link the llvm files into a single file:
      (llvm-link (concat libs-llvm srcs-llvm) base-llvm)
      (llvm-link (concat libs-llvm (map with-ctgrind srcs-llvm))
                 (with-ctgrind base-llvm))
      ;; Apply lif onto the linked file:
      (println "Repairing" benchmark "...")
      ;; TODO: We should not run the remaining stuff if lif crashed.
      (let [{:keys [exit err]} (lif base-llvm lif-llvm)]
        (when (not= exit 0) (println (with-color :red exit " => " err))))
      (let [{:keys [exit err]} (lif (with-ctgrind base-llvm)
                                    (with-ctgrind lif-llvm))]
        (when (not= exit 0) (println (with-color :red exit " => " err))))
      ;; Optimize both the original code and lif's output:
      (dorun (pmap #(opt %1 %2 "-O3" "-unroll-count=0")
                   [base-llvm lif-llvm]
                   [opt-llvm lifopt-llvm]))
      (dorun (pmap #(opt %1 %2 "-O3" "-unroll-count=0")
                   [(with-ctgrind base-llvm) (with-ctgrind lif-llvm)]
                   [(with-ctgrind opt-llvm) (with-ctgrind lifopt-llvm)]))
      ;; Emit the corresponding asm files:
      (dorun (pmap emit-asm [base-llvm opt-llvm] [base-asm opt-asm]))
      (dorun (pmap emit-asm
                   [(with-ctgrind base-llvm) (with-ctgrind opt-llvm)]
                   [(with-ctgrind base-asm) (with-ctgrind opt-asm)]))
      (dorun (pmap #(emit-asm %1 %2 "-x86-cmov-converter=false")
                   [lif-llvm lifopt-llvm]
                   [lif-asm lifopt-asm]))
      (dorun (pmap #(emit-asm %1 %2 "-x86-cmov-converter=false")
                   [(with-ctgrind lif-llvm) (with-ctgrind lifopt-llvm)]
                   [(with-ctgrind lif-asm) (with-ctgrind lifopt-asm)]))
      ;; Produce the corresponding binaries:
      (dorun (pmap #(emit-bin %1 %2 "-lssl" "-lcrypto" "-lm")
                   [base-asm opt-asm lif-asm lifopt-asm]
                   [base-bin opt-bin lif-bin lifopt-bin]))
      (dorun (pmap #(emit-bin %1 %2 "-lssl" "-lcrypto" "-lm")
                   [(with-ctgrind base-asm) (with-ctgrind opt-asm)
                    (with-ctgrind lif-asm) (with-ctgrind lifopt-asm)]
                   [(with-ctgrind base-bin) (with-ctgrind opt-bin)
                    (with-ctgrind lif-bin) (with-ctgrind lifopt-bin)])))))

(defn verify-lif [benchmark]
  (do (print "Veryifing" benchmark "... ")
      (flush)
      (let [base (str (fs/path benchmark "bin" "base"))
            opt (str (fs/path benchmark "bin" "opt"))
            lif (str (fs/path benchmark "bin" "lif"))
            lifopt (str (fs/path benchmark "bin" "lifopt"))
            ;; Get the list of input files as file:
            inputs (map fs/file
                        (files-by-ext (fs/path benchmark "input") "bin"))
            ;; Run the original program onto the inputs:
            result-orig (mapv #(->> % (shell/sh opt :in) :out str/trim)
                              inputs)
            ;; Run the lif version onto the inputs:
            result-lif (mapv #(->> % (shell/sh lifopt :in) :out str/trim)
                             inputs)
            ;; Check whether all the results match or not:
            result-matched? (every? true? (map = result-orig result-lif))
            ;; OK or Fail message:
            result-msg (if result-matched? [:green "[pass]"] [:red "[fail]"])
            ;; Check the original program with ctgrind
            ;; (without opt, cause opts may remove branches):
            safe-orig? (every? false?
                               (pmap #(branch-on-secret? (with-ctgrind base) %)
                                     inputs))
            ;; Check programs produced by lif with ctgrind:
            safe-lif? (every? false?
                              (pmap #(branch-on-secret? (with-ctgrind lif) %)
                                    inputs))
            ;; OK or Fail messages due to leak:
            leak-msg-orig (if safe-orig?
                            [:green "[orig = safe]"]
                            [:red "[orig = leak]"])
            leak-msg-lif (if safe-lif?
                           [:green "[lif = safe]"]
                           [:red "[lif = leak]"])]
        (println (apply with-color result-msg)
                 (apply with-color leak-msg-orig)
                 (apply with-color leak-msg-lif)))))

(let [;; Parse the arguments from command line:
      {:keys [action options exit-msg ok?]} (parse-cli *command-line-args*)
      benchmarks (if-let [f (:file options)]
                   (-> f slurp (str/split #"\s"))
                   (:benchmarks options))]
  (do (cond exit-msg (println exit-msg)
            (= action :compile) (mapv apply-lif benchmarks)
            (= action :verify) (mapv verify-lif benchmarks)
            ;; TODO: only verify Lif if we get no errors from apply.
            (= action :both) (mapv (juxt apply-lif verify-lif) benchmarks))
      (println "Bye ;)")))
