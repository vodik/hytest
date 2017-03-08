(import hytest hytest.cli)
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

(defn test-set-trace [request good-value bad-value]
  (hytest.cli.set-trace request.config))
