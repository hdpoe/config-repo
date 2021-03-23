;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(load-file "~/.doom.d/eshell-aliases.el")
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;;
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
 (setq user-full-name "hpoe"
       user-mail-address "hpoe@churchofjesuschrist.org")

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
;;(setq doom-font (font-spec :family "monospace" :size 14))
;;(setq doom-font "DejaVu Sans Mono-24")

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-sourcerer)
;; (setq doom-theme 'doom-challenger-deep)
;; (setq doom-theme 'doom-solarized-dark)
;; (setq doom-theme 'doom-old-hope)
(setq doom-theme 'doom-nord-light)

;; HPOE Org Options
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-todo-keywords
   '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
(setq org-log-done 'time)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(ansi-color-names-vector
;;   ["#21242b" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
;; '(custom-safe-themes
;;   (quote
;;    ("99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "2047464bf6781156ebdac9e38a17b97bd2594b39cfeaab561afffcbbe19314e2" default)))
;; '(fci-rule-color "#5B6268")
;; '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
;; '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
;; '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
;; '(objed-cursor-color "#ff6c6b")
;; '(pdf-view-midnight-colors (cons "#bbc2cf" "#282c34"))
;; '(rustic-ansi-faces
;;   ["#282c34" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
;; '(vc-annotate-background "#282c34")
;; '(vc-annotate-color-map
;;   (list
;;    (cons 20 "#98be65")
;;    (cons 40 "#b4be6c")
;;    (cons 60 "#d0be73")
;;    (cons 80 "#ECBE7B")
;;    (cons 100 "#e6ab6a")
;;    (cons 120 "#e09859")
;;    (cons 140 "#da8548")
;;    (cons 160 "#d38079")
;;    (cons 180 "#cc7cab")
;;    (cons 200 "#c678dd")
;;    (cons 220 "#d974b7")
;;    (cons 240 "#ec7091")
;;    (cons 260 "#ff6c6b")
;;    (cons 280 "#cf6162")
;;    (cons 300 "#9f585a")
;;    (cons 320 "#6f4e52")
;;    (cons 340 "#5B6268")
;;    (cons 360 "#5B6268")))
;; '(vc-annotate-very-old-color nil))
;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(mode-line ((t (:background "black" :foreground "yellow" :weight bold)))))

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")


;; HPOE Emacs Options
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
       `((".*" ,temporary-file-directory t)))

(setq projectile-project-search-path '("~/Projects"))
(setq projectile-auto-discover t)
(setq dired-listing-switches "-laht")
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

;; HPOE Eshell Customization
(add-hook 'eshell-mode-hook
          (defun rm-eshell-postoutput-scroll-to-bottom ()
            (remove-hook 'eshell-output-filter-functions
                         'eshell-postoutput-scroll-to-bottom)))

;; HPOE Custom Functions for Keybindings
(defun my-dired-find-file (&optional arg)
  "Open each of the marked files, or the file under the point, or when prefix arg, the next N files, each in a new window."
  (interactive "P")
  (mapc (lambda(file) (evil-window-vsplit nil file)) (dired-get-marked-files nil arg)))


;; HPOE Custom Keybindings
(map! :leader
      (:prefix-map ("j" . "json")
       :desc "Format Json" "j" #'json-pretty-print-buffer))

(map! :leader
      (:prefix-map ("g" . "git")
       :desc "Pull" "p" #'magit-pull))

(map! :leader
      (:prefix-map ("g" . "git")
       :desc "Push" "P" #'magit-push))

(map! :leader
      :desc "Unicode Char" "U" #'insert-char)

(map! :leader
      (:prefix-map ("m" . "localleader")
       :desc "Open Marked Files" "o" #'my-dired-find-file))

;; HPOE Display
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-visual-line-mode t)
(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 24))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; (load-theme 'matrix)
;;(setq doom-theme 'doom-acario-dark)
(setq doom-theme 'doom-Iosvkem)

;;; HPOE PRESENTATION mode
;;;(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 24))
;;;(setq doom-theme 'doom-one-light)

;; HPOE documentation
;; Add new entries to the drawer
;;(map! :leader < Specifies space key
;;      (:prefix-map ("j" . "json") < For nested commands specify this char
;;        :desc "Format Json" "j" #'json-pretty-print-buffer))  < Actual key and command

;; POWER MODE
;;; To run, evaluate:
;;(add-hook 'after-change-functions 'power-shake-hook nil t)
;;
;; To Stop:
;;  (remove-hook 'after-change-functions 'power-shake-hook)
;; or
;;  (setq after-change-functions (cdr after-change-functions))

;; HPOE Customizations
;;
;;(eval-after-load "dired"
;;  '(progn
;;     (define-key dired-mode-map "F" 'my-dired-find-file)
;;     (defun my-dired-find-file (&optional arg)
;;       "Open each of the marked files, or the file under the point, or when prefix arg, the next N files each in a new window."
;;       (interactive "P")
;;       (let* ((fn-list (dired-get-marked-files nil arg)))
;;         (mapc 'evil-window-vsplit nil fn-list)))))
;;(evil-window-vsplit &optional COUNT FILE)


;; HPOE LANG
(elpy-enable)
(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)

;; HPOE Custom File Associations
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode))

;; HPOE browsers
;;(setq browse-url-browser-function 'w3m-browse-url)
;;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
