;; full screen on start up
(set-frame-parameter nil 'fullscreen 'fullboth)

;; font size
(set-face-attribute 'default nil :height 240)

;; clojure
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

;; swap meta and super
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
