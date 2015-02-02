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
(setq tramp-default-method "ssh")

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
;(package-initialize)
(elpy-enable)
(elpy-use-ipython)
;(elpy-clean-modeline)
(setq elpy-rpc-backend "jedi")

;; Python 
(when (require 'elpy nil t)
 (elpy-enable)
;;  Use the system python virtualenv with emacs.
;;  This uses virtualenvwrapper
 (venv-workon "emacs")
;;  cleaner modeline
;;  (elpy-clean-modeline)
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

(setq-default ess-dialect "R")
(setq ess-use-auto-complete 'script-only)
;; (setq inferior-R-program-name "/usr/local/bin/R")
(setq interior-R-program-name "/Applications/R.app/Contents/MacOS/R")
(add-to-list 'auto-mode-alist '("\\.R$" . R-mode) '("\\.r$" . R-mode))

;; Path to juilia
;; (setq interior-juilia-program-name "/Applications/Julia-0.2.1.app/Contents//Resources/julia/bin/julia")
