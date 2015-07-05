(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setenv "LANG" "ja_JP.UTF-8")
(set-language-environment "Japanese")

(when (eq window-system 'ns)
  (set-face-attribute 'default nil
                      :family "Menlo"
                      :height 140) ;; 14pt
  (set-fontset-font nil 'japanese-jisx0208
		    (font-spec :family "Hiragino Kaku Gothic ProN"))
  (setq face-font-rescale-alist
        '((".*Hiragino Kaku Gothic ProN.*" . 1.2))))
(setq line-spacing 0.2)
(column-number-mode t)

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)
(global-set-key "\C-]" 'undo)
(global-set-key "\M-r" 'revert-buffer)
(global-set-key "\C-\M-]" 'indent-region)
(define-key global-map [?¥] [?\\])

(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)

(setq load-path (cons "/Users/ytabira/Dropbox/site-lisp/" load-path))
(setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))

(put 'narrow-to-region 'disabled nil)
(load "term/bobcat")
(when (fboundp 'terminal-init-bobcat)
  (terminal-init-bobcat))

(defun toggle-truncate-lines ()
  "toggle truncate lines."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; http://niku.name/articles/2013/04/30/emacs%E3%81%A7ls%20does%20not%20support%20--dired;%20see%20%60dired-use-ls-dired%27%20for%20more%20details.%E3%81%A8%E5%87%BA%E3%81%9F%E3%81%A8%E3%81%8D%E3%81%AE%E5%AF%BE%E5%87%A6%E6%96%B9%E6%B3%95
(setq dired-use-ls-dired t)
(when (eq system-type 'darwin)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))

;; http://www.emacswiki.org/emacs/WindMove
;; Windmove is a library built into GnuEmacs starting with version 21. It lets you move point from window to window using Shift and the arrow keys
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(when window-system (tool-bar-mode -1))

(setq make-backup-files nil)

(setq el-get-user-package-directory (locate-user-emacs-file "init"))
(el-get-bundle auto-complete)
;;(el-get-bundle rbenv)
;;(el-get-bundle ruby-mode)
(el-get-bundle s)
(el-get-bundle f)
;;(el-get-bundle yasnippet)
(el-get-bundle Enhanced-Ruby-Mode)
(el-get-bundle ruby-end)
(el-get-bundle ruby-block)
(el-get-bundle rspec-mode)
;;(el-get-bundle auto-complete-ruby)
;;(el-get-bundle auto-complete-yasnippet)
(el-get-bundle robe-mode)
(el-get-bundle smart-newline)
(el-get-bundle anything-rurima)
;;(el-get-bundle magit)
;;(el-get-bundle magit-gitflow)
;;(el-get-bundle mew)
(el-get-bundle maxframe)
;;(el-get-bundle ieure/aws-el :name aws)
(el-get-bundle exec-path-from-shell)
(el-get-bundle sudo-ext)
(el-get-bundle bash-completion)
(el-get-bundle markdown-mode)
(el-get-bundle yaml-mode)
(el-get-bundle k1LoW/emacs-ansible)
(el-get-bundle php-mode)
(el-get-bundle coffee-mode)
(el-get-bundle go-mode)
(el-get-bundle jinja2-mode)
(el-get-bundle init-multiterm)
(el-get-bundle multi-term)
(el-get-bundle inf-ruby)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(safe-local-variable-values (quote ((c-hanging-comment-ender-p)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; javascript-modeのタブ幅を2に変更
;; http://qiita.com/sawamur@github/items/1eeacf63551c1215a1cd
(setq js-indent-level 2)

;; http://d.hatena.ne.jp/tunefs/20130212/p1
(global-set-key (kbd "C-c w o")
 (lambda () (interactive)
   (let ((url (concat "dict://" (read-from-minibuffer "" (current-word)))))
     (browse-url url))))

;; 以下の書式に従ってモードラインに日付・時刻を表示する
(setq display-time-string-forms
      '((format "%s/%s/%s(%s) %s:%s" year month day dayname 24-hours minutes)
        load
        (if mail " Mail" "")))
;; 時刻表示の左隣に日付を追加。
(setq display-time-kawakami-form t)
;; 24時間制
(setq display-time-24hr-format t)

;; 時間を表示
(display-time)
