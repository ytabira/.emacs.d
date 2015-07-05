(require 'inf-ruby)

(setq inf-ruby-default-implementation "pry")

(setq inf-ruby-eval-binding "Pry.toplevel_binding")

;; riなどのエスケープシーケンスを処理し、色付けする

(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)
