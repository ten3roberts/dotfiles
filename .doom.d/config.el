;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Tim Roberts"
      user-mail-address "ten3roberts@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; (setq doom-font (font-spec :family "monospace" :size 15))
(setq doom-font (font-spec :family "Fira Code" :size 15))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-palenight)
(setq doom-theme 'doom-palenight)

(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Automatically find projects
(setq projectile-project-search-path '("~/.code"))

;; Make evil snipe search the visible area of the buffer
(setq evil-snipe-scope 'visible)

;; Prompt for buffer when doing a split
;; (add-hook 'evil-window-vsplit 'projectile-find-file)

(setq scroll-margin 10)

;; Use side buttons on mouse to move forward and backward
(map! [mouse-8] #'better-jumper-jump-backward
      [mouse-9] #'better-jumper-jump-forward)

;; Rust configuration
;; Prefer rust-analyzer over rust-language-server
(setq rustic-lsp-server 'rust-analyzer)
(setq lsp-rust-analyzer-display-parameter-hints t)

(map! :n "SPC r r" 'rustic-cargo-run)
(map! :n "SPC r b" 'rustic-cargo-build)
(map! :n "SPC r t" 'Rustic_Cargo_Test)
(map! :n "SPC r c" 'rustic-cargo-check)
(map! :n "SPC r i" 'lsp-rust-analyzer-inlay-hints-mode)

;; Image preview in dired
(map!
  (:after dired
    (:map dired-mode-map
     "C-x i" #'peep-dired
     )))
(evil-define-key 'normal peep-dired-mode-map (kbd "j") 'peep-dired-next-file
                                             (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

;; Force splits to the right

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'string-inflection)
;; (require 'shfmt)

(map! :nv "SPC e u" 'string-inflection-underscore)
(map! :nv "SPC e p" 'string-inflection-pascal-case)
(map! :nv "SPC e c" 'string-inflection-camelcase)
(map! :nv "SPC e k" 'string-inflection-kebab-case)
(map! :nv "SPC e e" 'string-inflection-all-cycle)

;; Rainbow mode
(map! :n "SPC m r" 'rainbow-mode)
;; Shell formatting
;; (map! :ni "M v" 'yank)
;; (map! :ni "M c" 'kill-ring-save)

(setq save-interprogram-paste-before-kill t)

;; (defun jump-to-console ()
;;   "go to terminal buffer if it exists, otherwise create"
;;   (interactive)
;;   (let ((buffer-name "terminal"))
;;     (if (get-buffer buffer-name)
;;         (pop-to-buffer buffer-name)
;;       (pop-to-buffer (get-buffer-create buffer-name))
