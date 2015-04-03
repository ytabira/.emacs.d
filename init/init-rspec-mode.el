 ;; C-c , v RSpec実行
 ;; C-c , s カ-ソルが当たっているサンプルを実行
 ;; C-c , t Specとソースを切り替える
(require 'rspec-mode)
;;(custom-set-variables '(rspec-use-rake-flag nil))
(eval-after-load 'rspec-mode
 '(rspec-install-snippets))

;; Debugging
;; When you've hit the breakpoint, hit C-x C-q to enable inf-ruby.
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

; Auto-scrolling
(setq compilation-scroll-output t)
