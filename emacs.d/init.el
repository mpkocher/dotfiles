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
  '(geiser paredit edit-server sr-speedbar org ace-jump-mode nrepl clojure-mode magit pylint scala-mode2 haskell-mode markdown-mode yasnippet graphviz-dot-mode fsharp-mode highlight-escape-sequences exec-path-from-shell)
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


; elisp
(require 'paredit)
(require 'highlight-parentheses)

;(setq hl-paren-colors '("red1" "orange1" "yellow1" "green1" "cyan1" "slateblue1" "magenta1" "purple"))

(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)

(require 'eldoc) ; if not already loaded
(eldoc-add-command 'paredit-backward-delete 'paredit-close-round)

; scheme
(setq geiser-impl-installed-implementations '(racket))
(require 'geiser)

(setq geiser-racket-binary "/Applications/Racket v5.3.6/bin/racket")

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

; 
(require 'edit-server)
;(edit-server-start)

; AceJump goodness
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

; Undo 
(require 'undo-tree)
(global-undo-tree-mode 1)

; Go to the place in the file when you reopen the buffer
(require 'saveplace)
(setq-default save-place t)

; Display the matching parens
(show-paren-mode 1)

(require 'smex)
(smex-initialize)

(require 'magit)

(require 'slime)
(slime-setup)

; global clojure
(require 'clojure-mode)

(add-hook 'clojure-mode-hook (lambda () (highlight-parentheses-mode t) (paredit-mode t)
(slime-mode t)))


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

;; Javascript
(require 'js2-mode)
(require 'nodejs-repl)

;; Javascript Swank
(require 'slime-js)


;Finally, you will want to set up slime-js-minor-mode when the javascript mode of your choice is enabled:
;(add-hook ‘js-mode-hook (lambda () (slime-js-minor-mode 1)))


; Scala Support
(require 'scala-mode2)

;; ; Python 
;; (when (require 'elpy nil t)
;;  (elpy-enable)
;; ;  Use the system python virtualenv with emacs.
;;  (virtualenv-workon "dev_pbcore")
;; ;  cleaner modeline
;;   (elpy-clean-modeline)
;;  (setq elpy-rpc-backend "jedi")
;;  (elpy-use-ipython)
;; ;  use iPython
;;  (setq py-shell-name "ipython")
;; )

; IPython Notebook via eic
;(require 'eic)

; Company
(require 'company)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)

; Ruby 
;(require 'ruby-mode)
;(require 'rvm)
(require 'cl)
(require 'compile)

(require 'auto-complete-config)

;(rvm-use-default)
(setq enh-ruby-program "/Users/mkocher/.rvm/rubies/ruby-1.9.3-p194/bin/ruby")
(require 'enh-ruby-mode)

;; gem install pry pry-doc yard
(add-hook 'ruby-mode-hook 'robe-mode)

(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))

(setq enh-ruby-bounce-deep-indent t)
(setq enh-ruby-hanging-brace-indent-level 2)

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'yard-mode)

(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'yard-mode)

(push 'company-robe company-backends)
(push 'ac-source-robe ac-sources)

(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

(require 'smartparens-config)
 (require 'smartparens-ruby)
 (smartparens-global-mode)
 (show-smartparens-global-mode t)
 (sp-with-modes '(rhtml-mode)
   (sp-local-pair "<" ">")
   (sp-local-pair "<%" "%>"))

;(require 'inf-ruby)
; http://www.emacswiki.org/emacs/InfRubyCompany
;(add-hook 'inf-ruby-mode-hook (lambda () (require 'inf-ruby-company)))

;; (defun my-inf-ruby-mode-hook ()
;;     (set (make-local-variable 'ac-auto-start) 2)
;;     (set (make-local-variable 'ac-auto-show-menu) t)
;; )

;(add-hook 'inf-ruby-mode-hook 'my-inf-ruby-mode-hook)

;; ido
(require 'ido)
(ido-mode t)
(global-set-key "\C-x\C-b" 'ibuffer)

;
(require 'osx-browse)
(osx-browse-mode 1)

; http://emacsfodder.github.io/blog/powerline-enhanced/
; OSX with --cocoa doesn't work with this
(require 'powerline)

(powerline-default-theme)

;; Themes
;; (load-theme 'fogus)
;(load-theme 'jadedragon)
(load-theme 'hickey)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("73abbe794b6467bbf6a9f04867da0befa604a072b38012039e8c1ba730e5f7a5" "3b7e62b9884f1533f8eac5d21b252e5b8098274d7d9096521db84e4f10797ae3" "d0ff5ea54497471567ed15eb7279c37aef3465713fb97a50d46d95fe11ab4739" "dc46381844ec8fcf9607a319aa6b442244d8c7a734a2625dac6a1f63e34bc4a6" "f220c05492910a305f5d26414ad82bf25a321c35aa05b1565be12f253579dec6" "d293542c9d4be8a9e9ec8afd6938c7304ac3d0d39110344908706614ed5861c9" "8eaa3bce3c618cd81a318fcf2d28c1cd21278531f028feb53186f6387547dfb4" default)))
 '(menu-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

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
