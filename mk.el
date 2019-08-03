;; Custom funcs/utils and keybindings

;; MK elisp utils. Most of these are taken from  http://ergoemacs.org/

(defun mk-new-empty-buffer ()
  "Create a new empty buffer.
New buffer will be named “untitled” or “untitled<2>”, “untitled<3>”, etc.

URL `http://ergoemacs.org/emacs/emacs_new_empty_buffer.html'
Version 2016-12-27"
  (interactive)
  (let (($buf (generate-new-buffer "untitled")))
    (switch-to-buffer $buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)))

s
(defun mk-show-kill-ring ()
  "Insert all `kill-ring' content in a new buffer.

URL `http://ergoemacs.org/emacs/emacs_show_kill_ring.html'
Version 2017-06-19"
  (interactive)
  (let (($buf (generate-new-buffer "untitled")))
    (progn
      (switch-to-buffer $buf)
      (funcall 'fundamental-mode)
      (setq buffer-offer-save t)
      (dolist (x kill-ring )
        (insert x "\n--------------------------------------------------\n\n"))
      (goto-char (point-min)))))


;; https://gist.github.com/lateau/5260613
(defun dont-kill-emacs()
  "Disable C-x C-c binding execute kill-emacs."
  (interactive)
  (error (substitute-command-keys "To exit emacs: \\[kill-emacs]")))


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
(global-set-key (kbd "C-x C-c") 'dont-kill-emacs)
(global-hl-line-mode -1) ; Disable current line highlight
(global-linum-mode) ; Show line numbers by default

(setq python-shell-interpreter "ipython3")

;;; R-lang
;; How to unbind C-k?
;; https://github.com/syl20bnr/spacemacs/blob/master/layers/%2Blang/ess/packages.el#L110
;; (unbind-key (kbd "C-k") )
;;(define-key inferior-ess-mode-map (kbd "C-k") 'comint-previous-input)

