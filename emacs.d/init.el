;; Custom MK settings
;; Disable toolbar in GUI
(tool-bar-mode -1)
(menu-bar-mode -1)

;;
;; only do this in the window mode. It looks wrong in terminal
(if window-system
    (menu-bar-mode 1)
  (global-linum-mode 1))

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
    '(clojure-mode pylint scala-mode2 haskell-mode markdown-mode yaml-mode yasnippet)
      "A list of packages to ensure are installed at launch.")

(dolist (p prelude-packages)
    (when (not (package-installed-p p))
          (package-install p)))
;; VirtualEnv
;;(autoload 'virtualenv-autoloads)

;; Load pylint
;(autoload 'python-pylint "python-pylint")
;(autoload 'pylint "python-pylint")

;; Scala Support
(require 'scala-mode2)

(load-theme 'jadedragon)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("3b7e62b9884f1533f8eac5d21b252e5b8098274d7d9096521db84e4f10797ae3" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
