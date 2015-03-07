;; maxframe provides the ability to maximize the emacs frame and stay within the display resolution.
;; https://github.com/rmm5t/maxframe.el
(require 'maxframe)
(setq mf-max-width 2560)  ;; Pixel width of main monitor.
(add-hook 'window-setup-hook 'maximize-frame t)
