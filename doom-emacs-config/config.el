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
;;(setq doom-theme 'doom-nord-light)

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
          (defun hpoe-eshell-mode-setup ()
            (remove-hook 'eshell-output-filter-functions
                         'eshell-postoutput-scroll-to-bottom)))

;; HPOE Custom Functions for Keybindings
(defun my-dired-find-file (&optional arg)
  "Open each of the marked files, or the file under the point, or when prefix arg, the next N files, each in a new window."
  (interactive "P")
  (mapc (lambda(file) (evil-window-vsplit nil file)) (dired-get-marked-files nil arg)))

;; (add-hook 'eshell-mode-hook
;;           (lambda ()
;;             (interactive)
;;             (define-key eshell-mode-map
;;               (kbd "C-l") 'eshell/clear-scrollback)))

;; (add-hook 'eshell-mode-hook
;;           (lambda ()
;;             (define-key eshell-mode-map
;;               [remap eshell/clear] eshell/clear-scrollback)))
;; (add-hook 'eshell-mode-hook
;;           (lambda ()
;;             (setq eshell-mode-map
;;                   (append
;;                    (remove (nth 12 eshell-mode-map) eshell-mode-map)
;;                    '((12  #'eshell/clear-scrollback))))))

(after! esh-mode
  (map! :map eshell-mode-map
        :n  "RET"    #'+eshell/goto-end-of-prompt
        :n  [return] #'+eshell/goto-end-of-prompt
        :ni "C-j"    #'eshell-next-matching-input-from-input
        :ni "C-k"    #'eshell-previous-matching-input-from-input
        :ig "C-d"    #'+eshell/quit-or-delete-char
        :i  "C-c h"  #'evil-window-left
        :i  "C-c j"  #'evil-window-down
        :i  "C-c k"  #'evil-window-up
        :i  "C-c l"  #'evil-window-right
        "C-s"   #'+eshell/search-history
        ;; Emacs bindings
        "C-e"   #'end-of-line
        ;; Tmux-esque prefix keybinds
        "C-c s" #'+eshell/split-below
        "C-c v" #'+eshell/split-right
        "C-c x" #'+eshell/kill-and-close
        [remap split-window-below]  #'+eshell/split-below
        [remap split-window-right]  #'+eshell/split-right
        [remap doom/backward-to-bol-or-indent] #'eshell-bol
        [remap doom/backward-kill-to-bol-and-indent] #'eshell-kill-input
        [remap evil-delete-back-to-indentation] #'eshell-kill-input
        [remap evil-window-split]   #'+eshell/split-below
        [remap evil-window-vsplit]  #'+eshell/split-right
        ;; To emulate terminal keybinds
        "C-l"   (lambda () (interactive) (eshell/clear-scrollback)(eshell-send-input));;#'eshell/clear-scrollback
        (:localleader
         "b" #'eshell-insert-buffer-name
         "e" #'eshell-insert-envvar
         "s" #'+eshell/search-history)))

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

(map! :map python-mode-map
      (:localleader "f" #'py-autopep8-buffer))

;; (map! :leader
;;       (:prefix-map ("a" . "applications")
;;        (:prefix ("j" . "journal")
;;         :desc "New journal entry" "j" #'org-journal-new-entry
;;         :desc "Search journal entry" "s" #'org-journal-search)))
;;'

;; HPOE Display
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-visual-line-mode t)
;;(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 12))
(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 24))
;;(setq doom-theme 'doom-one-light)
;;(setq doom-theme 'doom-one-light)


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; (load-theme 'matrix)
;;(setq doom-theme 'doom-acario-dark)
;; (setq doom-theme 'doom-Iosvkem)
(setq doom-theme 'doom-homage-black)

;;; HPOE PRESENTATION mode
;;(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 36))
;;;(setq doom-theme 'doom-one-light)

;; HPOE documentation
;; Add new entries to the drawer
;;(map! :leader < Specifies space key
;;      (:prefix-map ("j" . "json") < For nested commands specify this char
;;        :desc "Format Json" "j" #'json-pretty-print-buffer))  < Actual key and command

;; HPOE LANG
(elpy-enable)
(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)

;; HPOE Custom File Associations
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode))

;; HPOE browsers
;;(setq browse-url-browser-function 'w3m-browse-url)
;;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)

;;(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
