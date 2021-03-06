(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jpbuilder$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile$" . enh-ruby-mode))
(setq enh-ruby-deep-indent-paren nil)
(add-hook 'enh-ruby-mode-hook #'rubocop-mode)
