(require 'use-package)
(require 'general)

(put 'general-define-key 'lisp-indent-function 'defun)
(put 'general-create-definer 'lisp-indent-function 'defun)

(defalias 'bind #'general-define-key)
(put 'bind 'lisp-indent-function 'defun)

(general-create-definer bind-local :keymaps 'local)
(put 'bind-local 'lisp-indent-function 'defun)

;; NOTE
;; on gnome, have to unbind M-SPC, known as Alt+Space in
;; settings → windows → activate the window menu
(general-create-definer bind*
  :states '(emacs normal visual motion insert)
  :global-prefix "C-c"
  :non-normal-prefix "M-SPC"
  :prefix "SPC")

(put 'bind* 'lisp-indent-function 'defun)

(defun my-emacs-dir (path)
  (expand-file-name path user-emacs-directory))

(defun my-cache-dir (path)
  (my-emacs-dir (concat "cache/" path)))

(defun my-inits-dir (path)
  (my-emacs-dir (concat "inits/" path)))

(defun my-is-fullscreen ()
  (memq (frame-parameter nil 'fullscreen) '(fullscreen fullboth)))

(defun my-go-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'fullboth))

(defun my-un-fullscreen ()
  (set-frame-parameter nil 'fullscreen nil))

(defvar my-was-fullscreen)

(defun my-fullscreen-if-wasnt ()
  (if (my-is-fullscreen)
      (setq my-was-fullscreen t)
    (progn
      (setq my-was-fullscreen nil)
      (my-go-fullscreen))))

(defun my-unfullscreen-if-wasnt ()
  (when (not my-was-fullscreen)
    (my-un-fullscreen)))

(defmacro my-setq-append (var &rest elems)
  `(setq ,var (append ,var '(,@elems))))

(defmacro my-after-frame (body)
  `(if (daemonp)
       (add-hook 'after-make-frame-functions
                 (lambda (frame)
                   (with-selected-frame frame
                     ,body)))
     ;; can get current frame with
     ;; (window-frame (get-buffer-window))
     ,body))

(defun my-get-faces (pos)
  "Get the font faces at POS."
  (remq nil
        (list
         (get-char-property pos 'read-face-name)
         (get-char-property pos 'face)
         (plist-get (text-properties-at pos) 'face))))

(defun my-what-face (pos)
  (interactive "d")
  (let ((face (my-get-faces pos)))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

; (defun my-eval-after-load-all (features body)
;   (if (null features)
;       body
;     (let ((feat (car features))
;           (nested (my-eval-after-load-all (cdr features) body)))
;       `(eval-after-load (quote ,feat) (quote ,nested)))))

; (defmacro my-eval-after-load-all-macro (features body)
;   (if (null features)
;       body
;     `(eval-after-load (quote ,(car features))
;        (quote (my-eval-after-load-all-macro ,(cdr features) ,body)))))

(provide 'conf/common)
