;; full screen on start up
(set-frame-parameter nil 'fullscreen 'fullboth)

;; font size
(set-face-attribute 'default nil :height 240)

;; swap meta and super
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; install some packages 
(prelude-require-packages '(rainbow-delimiters color-theme-sanityinc-tomorrow))

;; clojure
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
