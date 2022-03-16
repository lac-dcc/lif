(require '[clojure.tools.cli :as cli]
         '[clojure.string :as str])

(def cli-options
  [;; TODO: Add option to test a list of benchmarks (all).

   ;; Specify the path to the benchmark to be tested.
   ;;
   ;; The benchmark folder must contain:
   ;; 1. A lib folder with its corresponding source code;
   ;; 2. An include folder with the header files;
   ;; 3. A main folder with a main.c file;
   ;; 4. An input folder with n > 0 input files; and
   ["-b" "--benchmarks PATH"
    "Path to a specific benchmark (allow multiple entries).
     \t\t\t     The benchmark folder must contain:
     \t\t\t       1. A lib folder with the source code;
     \t\t\t       2. An include folder with the headers;
     \t\t\t       3. A main folder with a main.c file;
     \t\t\t       4. An input folder with n > 0 files; and"
    :multi true
    :update-fn conj
    :default []]

   ;; Specify the path to a file containing a list of the benchmarks
   ;; to be tested separated by space, newline, or etc. Each benchmark
   ;; folder must follow the same rules from --benchmarks option. This
   ;; option has higher priority than --benchmarks.
   ["-f" "--file PATH"
    "Path to a file containing a list of benchmarks separated
     \t\t\t     by space, new line, etc. Every benchmark folder must follow
     \t\t\t     the same rules from option --benchmarks (see above)."]

   ;; TODO: Add option to allow the user to collect info about the isochronified
   ;; benchmarks.

   ;; Show a help message with instructions on how to use this test framework.
   ["-h" "--help" "Print this usage summary."]])

(def cli-actions
  {:compile ["Compile the benchmarks, generating the llvm files,"
             "asm files, and the corresponding binaries. The"
             "result will be stored at PATH/llvm-ir, PATH/asm,"
             "and PATH/bin. See the option \"--benchmark\" for"
             "more info about PATH."]

   :verify ["Test the original program and Lif's output onto the"
            "available inputs, to verify the correctness of the"
            "code produced by Lif."]

   :both ["Compile & verify the correctness of the code produced"
          "by Lif at once."]

   ;; TODO: Add option to plot the collected data about the benchmarks.
   })

(defn as-summary
  "Takes a pair key and descs (a collection of strings), an
  integer representing the number of spaces to shift as prefix,
  and another integer representing the maximum number of spaces
  to fill as alignment. You can use this function to transform
  key and val into a single filled with spaces such that it can
  be aligned with other strings.

  Example:

  (def pair1 '(\"key\" [\"description\"]))
  (def pair2 '(\"really-long-key\" [\"multiline\" \"description\"]))
  (def shift 2)
  (def align (+ (-> pair2 first count) 4))
  (println
   (str/join \newline [(-> pair1 (as-summary shift align))
                       (-> pair2 (as-summary shift align))]))

  ; (out) key                description
  ; (out) really-long-key    multiline
  ;                          description"
  [[key [desc & descs]] shift align]
  (let [spaces #(-> % (repeat " ") str/join)
        align-prefix (spaces shift)
        align-head (spaces (+ (- align (count key)) shift))
        align-rest (spaces (+ align shift))]
    (str align-prefix key
         (reduce #(str %1 \newline align-prefix align-rest %2)
                 (str align-head desc) descs))))

(defn parse-actions
  "Returns a map with :actions as a set of the available actions
  and :summary as a pretty print of the actions."
  [actions]
  (let [;; "actions" is a map with key/value pairs like :action
        ;; "description". We transform into a sequence so we can
        ;; loop through each pair [:action desc] and construct
        ;; the summary. Thus, entries is of the form ([action1
        ;; desc1] [action2 desc2]).
        entries (map (fn [[k v]] [(name k) v]) (seq actions))
        ;; We count the length of the longest name so we can
        ;; align their descriptions.
        max-len (apply max (map (comp count first) entries))]
    {:actions (-> actions keys set)
     :summary (->> (map #(as-summary % 2 (+ max-len 4)) entries)
                   (str/join \newline))}))

(defn usage [actions-summary opts-summary]
  (->> [(apply str (concat (repeat 31 "=")
                           " Lif's Test Framework "
                           (repeat 31 "=")))
        "Usage: bb run.clj action [options]"
        ""
        "Actions:"
        actions-summary
        ""
        "Options:"
        opts-summary
        (apply str (repeat 84 "="))]
       (str/join \newline)))

(defn error-msg [errors]
  (str "The following errors occurred while parsing"
       " your command:\n\n"
       (str/join \newline errors)))

(defn parse-cli
  "Either return a map indicating the program should exit
  (with a message and ok status) or a map indicating the action
  the program should take and the options provided."
  [cli-args]
  (let [;; Parse & destructure the command-line options:
        {opts :options args :arguments opts-summary :summary}
        (cli/parse-opts cli-args cli-options)
        ;; Parse & destructure the available actions:
        {actions :actions actions-summary :summary}
        (parse-actions cli-actions)
        ;; TODO: do the same for options (i.e. multiline summary).
        ;; The script accepts only one action, so we discard the
        ;; remaining arguments.
        act-name (first args)
        act (-> act-name keyword actions)]
    (cond
      ;; help => exit with usage summary
      (:help opts)
      {:exit-msg (usage actions-summary opts-summary) :ok? true}
      ;; valid action => return the action and the options
      (actions act)
      {:action act :options opts :ok? true}
      ;; invalid action => return with error
      :else
      {:exit-msg
       (-> (str ">>> \"" act-name \" " is not a valid action!")
           vector
           error-msg)
       :ok? false})))
