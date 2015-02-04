;; -*- mode: Lisp
;; Aquamacs will load this on initialization

(tool-bar-mode 0) ;; turn off toolbar
(scroll-bar-mode -1) ;; No scroll bar

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(show-paren-mode 1)

; Start in server mode
(require 'server)
(unless (server-running-p)
  (server-start))


(defvar required-packages
  '(smex
    powerline
    magit
    ace-jump-mode
    scala-mode2
    sbt-mode
    virtualenvwrapper
    elpy
    ess
    projectile
    flx-ido
    js2-mode))

;; Install packages if necessary
(dolist (p required-packages)
  (when (not (package-installed-p p))
    (package-install p)))

; Load the .bashrc. When launching emacs from OSX GUI, the env is not inherited. And
; shells run within emacs will not the expected env.
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(load-theme 'bubbleberry)

(projectile-global-mode)
;; (setq projectile-completion-system 'helm)
;; (helm-projectile-on)

(require 'flx-ido)   

;; Better M-x
(require 'smex)
(smex-initialize)

;; Better Dired+
(require 'dired+)

;; Better
(require 'powerline)
(powerline-default-theme)

;; Eshell tweaks
;; http://www.howardism.org/Technical/Emacs/eshell-fun.html
(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(defun eshell/x ()
  (insert "exit")
  (eshell-send-input)
  (delete-window))

;;
; AceJump goodness
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Scala
(require 'scala-mode2)
(require 'sbt-mode)

;; Git magic
(require 'magit)

;; Python
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
;(setq venv-location "~/.virtualenvs/")

;; New elpy config
(elpy-enable)
(elpy-use-ipython)
(setq elpy-rpc-backend "jedi")

;; Python 
(when (require 'elpy nil t)
 (elpy-enable)
;;  Use the system python virtualenv with emacs.
;;  This uses virtualenvwrapper
 (venv-workon "emacs")
;;  cleaner modeline
 (setq elpy-rpc-backend "jedi")
 (elpy-use-ipython)
;  use iPython
 (setq py-shell-name "ipython")
)

(require 'py-autopep8)
(add-hook 'before-save-hook 'py-autopep8-before-save)
(setq py-autopep8-options '("--ignore=E501"))

;;; ESS R integration
(require 'ess)
(require 'ess-site)
(require 'ess-eldoc) 
(setq ess-eval-visibly-p nil) 

(setq-default ess-dialect "R")
(setq ess-use-auto-complete 'script-only)
;; (setq inferior-R-program-name "/usr/local/bin/R")
(setq interior-R-program-name "/Applications/R.app/Contents/MacOS/R")
(add-to-list 'auto-mode-alist '("\\.R$" . R-mode) '("\\.r$" . R-mode))

;; Javascript
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(custom-set-variables '(js2-strict-inconsistent-return-warning nil))
(setq js-indent-level 2)
(setq js2-indent-level 2)
(setq js2-basic-offset 2)
(add-hook 'js2-mode-hook '(lambda ()
                            (local-set-key (kbd "RET") 'newline-and-indent)))
;; Still need to setup node repl interaction

;; CSS
(setq css-indent-offset 2)

;; Auto Complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
;; I am not sure this is necessary
(setq ess-use-auto-complete t)
