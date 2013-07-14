;; Custom MK settings
;; Disable toolbar in GUI
(tool-bar-mode -1)
;;(menu-bar-mode -1)

;;
;; only do this in the window mode. It looks wrong in terminal
;;(if window-system
;;    (menu-bar-mode 1)
;;  (global-linum-mode 1))
(global-linum-mode 1)
;;
;; Package Manager
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;(add-to-list 'package-archives
;;	                  '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(defvar prelude-packages
    '(clojure-mode pylint scala-mode2 haskell-mode markdown-mode yaml-mode yasnippet graphviz-dot-mode fsharp-mode)
      "A list of packages to ensure are installed at launch.")

(dolist (p prelude-packages)
    (when (not (package-installed-p p))
          (package-install p)))
;; VirtualEnv
;;(autoload 'virtualenv-autoloads)

;; Load pylint
;(autoload 'python-pylint "python-pylint")
;(autoload 'pylint "python-pylint")

;; F# autocomplete
(add-hook 'fsharp-mode-hook
 (lambda ()
   ;; (define-key fsharp-mode-map (kbd "M-RET") 'fsharp-eval-region)
   (define-key fsharp-mode-map (kbd "M-RET") 'fsharp-ac/complete-at-point)))

;; Reasonable 
(defun set-newline-and-indent ()
      (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'ruby-mode-hook 'set-newline-and-indent)


;; Scala Support
(require 'scala-mode2)

;; Python 
(elpy-enable)
(elpy-use-ipython)
;; cleaner modeline
(elpy-clean-modeline)


;; Ruby This needs rsense
;; http://stackoverflow.com/questions/12160209/emacs-auto-complete-installed-by-package-from-http-marmalade-repo-org-doesnt
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)

;;(load-theme 'fogus)
;;(load-theme 'jadedragon)
(load-theme 'hickey)
