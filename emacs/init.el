;; EMACS configuration file
;; author: hujinghui
;; github: http://github.com/Jeanhwea

;; load EMACS 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(
    ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
    ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
   )))

(package-initialize)

;; remove some distracting things
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
;; Turn off mouse interface early in startup to avoid momentary display
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
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


;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; dipslay time in 24hr format
;; (display-time-mode t)
;; (setq display-time-24hr-format t)



;; -------------------- setup plugins --------------------


;; keep a list of recently opened files
(require 'recentf)
(recentf-mode t)
;; set F7 to list recently opened file
;; (global-set-key (kbd "<f7>") 'recentf-open-files)


(require 'yasnippet)
(yas-global-mode t)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
