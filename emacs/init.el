;; emacs configuration file
;; author: hujinghui
;; github: http://github.com/Jeanhwea

(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
(package-initialize)

;; remove some distracting things
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)

;; Turn off mouse interface early in startup to avoid momentary display
; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; upcase and lowercase
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; auto insert closing bracket
(electric-pair-mode t)

;; turn on bracket match highlight
(show-paren-mode t)

;; remember cursor position, for emacs 25.1 or later
(save-place-mode t)

;; UTF-8 as default encoding
;; (set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; show cursor position within line
(column-number-mode t)

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;; keep a list of recently opened files
(require 'recentf)
(recentf-mode t)
;; set F7 to list recently opened file
(global-set-key (kbd "<f7>") 'recentf-open-files)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; dipslay time in 24hr format
;(display-time-mode t)
;(setq display-time-24hr-format t)
 
