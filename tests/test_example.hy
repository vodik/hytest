(require [hytest.macros [*]])

;; Define two fixtures
(deffixture good-value [] 42)

(deffixture bad-value [good-value]
  (* good-value 2))

;; Define two tests
(defn test-good [good-value]
  (assert (= good-value 42)))

(defn test-bad [bad-value]
  (assert (= bad-value 42)))
