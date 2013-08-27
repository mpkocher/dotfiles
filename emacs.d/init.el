; Custom MK settings

; Start in server mode
(require 'server)
(unless (server-running-p)
  (server-start))

; Disable startup splash screen
(setq inhibit-startup-message t)

; Disable toolbar in GUI
(tool-bar-mode -1)
;(menu-bar-mode -1)
; Disable the scrollbar
(scroll-bar-mode -1)

; Emacs stupid beeping/alarm
; settings this to true makes the screen flash
; (setq visible-bell t)
(setq visible-bell nil)
(setq bell-volume 0)
(setq sound-alist nil)
; This disables everything?
(setq ring-bell-function 'ignore)


; only do this in the window mode. It looks wrong in terminal
;;(if window-system
;;    (menu-bar-mode 1)
;;  (global-linum-mode 1))

; Disabling default line number diplay. This is crutch for actually searching
; the file more efficiently. Use auto-jump
; (global-linum-mode 1)
(column-number-mode 1)

; http://www.emacswiki.org/emacs/EmacsForMacOS#toc12
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

; Don't open up files in a new Frame
(setq ns-pop-up-frames nil)

; System specific functions
(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))

;; Package Manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))


(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(defvar prelude-packages
  '(sr-speedbar org ace-jump-mode nrepl clojure-mode magit pylint scala-mode2 haskell-mode markdown-mode yasnippet graphviz-dot-mode fsharp-mode highlight-escape-sequences exec-path-from-shell)
      "A list of packages to ensure are installed at launch.")

(dolist (p prelude-packages)
    (when (not (package-installed-p p))
          (package-install p)))

; Load the .bashrc. When launching emacs from OSX GUI, the env is not inherited. And
; shells run within emacs will not the expected env.
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

; OrgMode
;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;(global-set-key "\C-cl" 'org-store-link)
;(global-set-key "\C-ca" 'org-agenda)
;(global-set-key "\C-cb" 'org-iswitchb)
;(global-font-lock-mode 1)                     ; for all buffers
(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only
(transient-mark-mode 1)
(setq org-log-done t
      org-hide-leading-stars t
      org-odd-levels-only t
      org-agenda-include-diary t)

; speedbar
(require 'sr-speedbar)

(require 'org-mouse)
;(setq org-agenda-files 
;      (list "/home/fxr/org/work.org"))

(require 'org-install)
(setq org-directory "~/org/"
      org-mobile-directory "~/Dropbox/org/"
      org-mobile-inbox-for-pull "~/org/from-mobile.org")

; ESS R integration
(require 'ess)
; set R exe


; auto complete
(setq ess-use-auto-complete 'script-only)

; AceJump goodness
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

; Undo 
(require 'undo-tree)
(global-undo-tree-mode 1)

; Got place in the file when you reopen the buffer
(require 'saveplace)
(setq-default save-place t)

; Display the matching parens
(show-paren-mode 1)

(require 'smex)
(smex-initialize)

(require 'magit)

; Load pylint
;(autoload 'python-pylint "python-pylint")
;(autoload 'pylint "python-pylint")

(add-hook 'clojure-mode-hook 'paredit-mode)

; F# autocomplete
(add-hook 'fsharp-mode-hook
 (lambda ()
   ;; (define-key fsharp-mode-map (kbd "M-RET") 'fsharp-eval-region)
   (define-key fsharp-mode-map (kbd "M-RET") 'fsharp-ac/complete-at-point)))

; Better and Smarter indenting. In 24.3 this can be done with electric?
(defun set-newline-and-indent ()
      (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'ruby-mode-hook 'set-newline-and-indent)
(add-hook 'python-mode-hook 'set-newline-and-indent)

; Slime mode
(setq inferior-lisp-program "sbcl")
(require 'slime)

;; Javascript
(require 'js2-mode)
(require 'nodejs-repl)

;; Javascript Swank
(require 'slime-js)


;Finally, you will want to set up slime-js-minor-mode when the javascript mode of your choice is enabled:
;(add-hook ‘js-mode-hook (lambda () (slime-js-minor-mode 1)))


; Scala Support
(require 'scala-mode2)

; Python 
(when (require 'elpy nil t)
  (elpy-enable)
  ;; Use the system python virtualenv with emacs.
  ;(virtualenv-workon "dev_pbcore")
  (virtualenv-workon "emacs")
  ;; cleaner modeline
  ;;(elpy-clean-modeline)
  (setq elpy-rpc-backend "jedi")
  (elpy-use-ipython)
  ;; use iPython
  (setq py-shell-name "ipython")
)

; IPython Notebook via eic
;(require 'eic)

; Company
(require 'company)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)

; Ruby 
(require 'ruby-mode)
(require 'rvm)

(rvm-use-default)
(require 'inf-ruby)
; http://www.emacswiki.org/emacs/InfRubyCompany
(add-hook 'inf-ruby-mode-hook (lambda () (require 'inf-ruby-company)))

(defun my-inf-ruby-mode-hook ()
    (set (make-local-variable 'ac-auto-start) 2)
    (set (make-local-variable 'ac-auto-show-menu) t)
)

(add-hook 'inf-ruby-mode-hook 'my-inf-ruby-mode-hook)

;; ido
(require 'ido)
(ido-mode t)
(global-set-key "\C-x\C-b" 'ibuffer)

;
(require 'osx-browse)
(osx-browse-mode 1)

;; Themes
;; (load-theme 'fogus)
;; (load-theme 'jadedragon)
(load-theme 'hickey)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8eaa3bce3c618cd81a318fcf2d28c1cd21278531f028feb53186f6387547dfb4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Auto-refresh dired on file change
(add-hook 'dired-mode-hook 'auto-revert-mode)

;; Colorful directory and file listing
(require 'dired+)

;; Need to load this after the theme is loaded so that colors
;; are set correctly.
(require 'multi-term)

;; Start server unless server is running
;(load "server")
;(unless (server-running-p) (server-start))

;; My location for external packages.
(add-to-list 'load-path "~/.emacs.d/site-lisp")

; http://emacsfodder.github.io/blog/powerline-enhanced/
; OSX with --cocoa doesn't work with this
(require 'powerline)
