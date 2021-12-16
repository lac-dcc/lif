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

(defn make-output-dirs [dir]
  (mapv (comp second (juxt fs/delete-tree fs/create-dirs))
        (map #(fs/path dir %) ["asm" "bin" "llvm-ir"])))

(defn files-by-ext [dir ext] (fs/glob dir (str "*." ext)))
(defn relativize->str [this] (comp str #(fs/relativize this %)))
(def strip-ext (comp first fs/split-ext))

(defn llvm-out->src [llvm-ir src]
  (->> src fs/file-name strip-ext (fs/path llvm-ir) (#(str % ".ll"))))

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
        lifopt-bin (str bin fs/file-separator "lifopt")
        ;; Get the config file:
        config "config.yaml"]
    (shell/with-sh-dir benchmark
      (println "Compiling" benchmark "...")
      ;; Emit the llvm intermediate files:
      (dorun (pmap emit-llvm (concat libs srcs) (concat libs-llvm srcs-llvm)))
      ;; Link the llvm files into a single file:
      (llvm-link (concat libs-llvm srcs-llvm) base-llvm)
      ;; Apply lif onto the linked file:
      (println "Repairing" benchmark "...")
      ;; TODO: We should not run the remaining stuff if lif crashed.
      (let [{:keys [exit err]} (lif base-llvm config lif-llvm)]
        (when (not= exit 0) (println (with-color :red exit " => " err))))
      ;; Optimize both the original code and lif's output:
      (dorun (pmap #(opt %1 %2 "-O3")
                   [base-llvm lif-llvm]
                   [opt-llvm lifopt-llvm]))
      ;; Emit the corresponding asm files:
      (dorun (pmap emit-asm [base-llvm opt-llvm] [base-asm opt-asm]))
      (dorun (pmap #(emit-asm %1 %2 "-x86-cmov-converter=false")
                   [lif-llvm lifopt-llvm]
                   [lif-asm lifopt-asm]))
      ;; Produce the corresponding binaries:
      (dorun (pmap emit-bin
                   [base-asm opt-asm lif-asm lifopt-asm]
                   [base-bin opt-bin lif-bin lifopt-bin])))))

(defn verify-lif [benchmark]
  (let [orig (str (fs/path benchmark "bin" "opt"))
        lif (str (fs/path benchmark "bin" "lifopt"))
        ;; Get the list of input files as file:
        inputs (map fs/file (files-by-ext (fs/path benchmark "input") "txt"))
        ;; Run the original program onto the inputs:
        result-orig (mapv #(->> % (shell/sh orig :in) :out str/trim) inputs)
        ;; Run the lif version onto the inputs:
        result-lif (mapv #(->> % (shell/sh lif :in) :out str/trim) inputs)
        ;; Check whether all the results match or not:
        result-matched? (every? true? (map = result-orig result-lif))
        ;; OK or Fail message:
        result-msg (if result-matched? [:green "[pass]"] [:red "[fail]"])]
    (println "Veryifing" benchmark "..." (apply with-color result-msg))))

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
