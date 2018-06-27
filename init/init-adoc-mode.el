(autoload 'adoc-mode "adoc-mode" nil t)
(require 'adoc-mode)
(add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))
;;(add-hook 'adoc-mode-hook (lambda() (buffer-face-mode t)))
