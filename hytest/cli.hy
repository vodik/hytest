(import pytest)

(defn set-trace [config]
  (do
   (import sys -pytest.config hy.cmdline)
   (setv frame (. (sys.-getframe) f-back)
         capman (config.pluginmanager.getplugin "capturemanager")
         tw (-pytest.config.create-terminal-writer config))

   (if capman
     (capman.suspendcapture :in- True))

   (tw.line)
   (tw.sep ">" "Hy.cli set-trace (IO-capturing turned off)")
   (-> (hy.cmdline.HyREPL False frame.f-locals)
       (hy.cmdline.run-repl))))
