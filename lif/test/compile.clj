(require '[clojure.java.shell :as shell])


(defn emit-asm
  "Takes a LLVM IR file and converts to asm. It also takes a
  name for the output file, as well as additional arguments."
  [src out & args]
  (apply shell/sh "llc" "-filetype=asm" src "-o" out args))

(defn emit-bin
  "Takes an assembly file and produces an executable from it, with
  debug information. It also takes a name for the output file."
  [src out]
  (shell/sh "clang" "-g" src "-o" out "-no-pie"))

(defn emit-llvm
  "Takes a source file and compiles it to its LLVM IR representation.
  The only optimization applied is --mem2reg, to promote memory to register.
  It also takes a name for the output file."
  [src out]
  (let [{:keys [exit] :as clang-result}
        (shell/sh "clang" src "-o" out "-emit-llvm" "-S" "-Xclang"
                  "-disable-O0-optnone" "-fno-discard-value-names")]
    (if (zero? exit)
      (shell/sh "opt" "-S" "-mem2reg" out "-o" out)
      clang-result)))

(defn llvm-link
  "Takes a list of LLVM IR files and links them together into a
  single LLVM IR file. It also takes a name for the output file."
  [srcs out]
  (apply shell/sh "llvm-link" "-S" "-o" out srcs))

(defn opt
  "Takes a LLVM IR file and a sequence of optimization flags. It
  also takes a name for the output file."
  [src out & args]
  (apply shell/sh "opt" src "-o" out "-S" args))

(defn lif
  "Takes a LLVM IR file, the path to its corresponding config.yaml file,
  a name for the output file, and an (optional) optimization level
  (integer 0, 1, 2, or 3)."
  ([src config out opt]
   (let [;; TODO: change for a non-hardcoded path.
         lif-bin "/home/luigi/workspace/lif/lif/bin/lif"]
     (shell/sh lif-bin src (str "--config=" config) (str "-O" opt) "-o" out)))
  ([src config out] (lif src config out 0)))
