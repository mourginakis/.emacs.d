;;;;
;; Packages & auto install
;;;;

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)


;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)


;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))



;; Declare Packages
(setq my-packages
      '(spacemacs-theme
	paredit
	clojure-mode
	cider
	rainbow-delimiters
	fill-column-indicator

	;; perhaps these in the future?
	;; ido-completing-read+ - M-x autocompletion
	;; projectile           - project navigation
	;; tagedit              - edit html tags like sexps
	;; magit                - git integration
	))



;; Iterate on packages and install missing ones
(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; Load spacemacs theme, ignoring safety
(load-theme 'spacemacs-dark t)



;;;;
;; UI
;;;;


;; Disable menu bar, tool bar, scroll bar
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; (load-theme 'tomorrow-night-bright t)

;; hightlight matching parens
(show-paren-mode 1)

;; Change all yes/no questions to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; (global-linum-mode -1) ; turn on line numbers

;; Show show col number in bottom of buffer
(column-number-mode 1)
;; Set full path in title bar
(setq-default frame-title-format "%b (%f)")
;; no bell
(setq ring-bell-function 'ignore)
(blink-cursor-mode 0)




;;;;
;; Package configs
;;;;

;; fill-column-indicator
(setq fci-rule-color "#2b313b")
(setq fci-rule-width 2)
(setq fci-rule-column 80)
(add-hook 'clojure-mode-hook 'fci-mode)


;; Paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'cider-repl-mode-hook       #'enable-paredit-mode)
(add-hook 'cider-mode-hook            #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; Rainbow-delimiters-mode
(add-hook 'cider-repl-mode-hook       #'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook            #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook          #'rainbow-delimiters-mode)





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (rainbow-delimiters spacemacs-theme paredit cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
