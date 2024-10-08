;; full screen on start up
(set-frame-parameter nil 'fullscreen 'fullboth)

;; font size
;;(set-face-attribute 'default nil :height 240)
(set-face-attribute 'default nil :height 140)

;; swap meta and super
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super))

;; install some packages
(prelude-require-packages '(rainbow-delimiters
                            color-theme-sanityinc-tomorrow
                            clj-refactor
                            drag-stuff
                            iedit
                            py-yapf
                            lsp-haskell
                            treemacs-projectile
                            geiser-guile))

;; projectile
(setq projectile-indexing-method 'hybrid)

;; treemacs
;; (add-hook 'emacs-startup-hook 'treemacs)
(global-set-key (kbd "C-x t t") 'treemacs)
(global-set-key (kbd "M-0") 'treemacs-select-window)

;; rainbow-delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "sienna1"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "pink"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "red")))))

;; clojure
(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-n"))
(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
;; formatting after save
(add-hook 'clojure-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'cider-format-buffer nil 'local)))

;; drag stuff
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

;; iedit global
(require 'iedit)

;; python
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)

;; elixir
;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

;; haskell
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)
