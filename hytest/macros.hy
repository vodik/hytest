(defmacro deffixture [name params body]
  `(do (import pytest)
       (with-decorator pytest.fixture
         (defn ~name ~params ~body))))
