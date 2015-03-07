;; (bundle rdoc-mode)
;; (el-get-lock-unlock 'inf-ruby)
;; (bundle inf-ruby
;;   (add-hook 'ruby-mode-hook #'inf-ruby-keys))
;;
;; (setq auto-mode-alist
;;       (append '(("\\.rb$" . ruby-mode)
;;                 ("Rakefile$" . ruby-mode)
;;                 ("\\.rdoc$" . rdoc-mode)) auto-mode-alist))
;; (add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
;;
;; (setq-default ruby-deep-indent-paren-style nil)
;;

;; --------------------------------------------------
;; ruby-mode
;; http://shibayu36.hatenablog.com/entry/2013/03/18/192651
;; --------------------------------------------------
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode)) ;; shebangがrubyの場合、ruby-modeを開く
