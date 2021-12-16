(def ansi-reset "\033[0m")
(def ansi-red "\033[0;31m")
(def ansi-green "\033[0;32m")
(def ansi-color {:red ansi-red :green ansi-green})

(defn with-color
  "Takes keyword of a color (e.g. :green), one or more texts (strings),
  and returns the (concatenated) text with the given color."
  [color text & texts]
  (str (color ansi-color) text (apply str texts) ansi-reset))
