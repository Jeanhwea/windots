;; EMACS configuration file
;; author: hujinghui
;; github: http://github.com/Jeanhwea


;; -------------------- package manager --------------------
;; load EMACS 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(
    ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
    ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
   )))

(package-initialize)


;; -------------------- initial options --------------------
;; open default disabled items
(progn
  ;; stop warning prompt for some commands. There's always undo.
  (put 'narrow-to-region 'disabled nil)
  (put 'narrow-to-page 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (put 'downcase-region 'disabled nil)
  (put 'erase-buffer 'disabled nil)
  (put 'scroll-left 'disabled nil)
  (put 'dired-find-alternate-file 'disabled nil)
)
;; remove some distracting things
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode 0))
(if (fboundp 'tool-bar-mode) (tool-bar-mode 0))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode 0))


;; -------------------- configuration mode --------------------
;; make cursor movement stop in between camelCase words.
(global-subword-mode t)
;; turn on highlighting current line
(global-hl-line-mode t)
;; when a file is updated outside emacs, make it update if it's already opened in emacs
(global-auto-revert-mode t)
;; auto insert closing bracket
(electric-pair-mode t)
;; make typing delete/overwrite selected text
(delete-selection-mode t)
;; turn on bracket match highlight
(show-paren-mode t)
;; remember cursor position, for emacs 25.1 or later
(save-place-mode t)
;; UTF-8 as default encoding
;; (set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
;; show cursor position within line
(column-number-mode t)
;; make cursor not blink
(blink-cursor-mode 0)
;; save/restore opened files and windows config
(desktop-save-mode 0)


;; -------------------- key bindings --------------------
;; easy keys for split windows
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "M-3") 'split-window-right)
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-RET") 'other-window)
(global-set-key (kbd "C-;") 'set-mark-command)


;; -------------------- misc --------------------
;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))
(setq backup-by-copying t)
;; stop creating those #auto-save# files
(setq auto-save-default nil)
;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
;; dipslay time in 24hr format
;; (display-time-mode t)
;; set cursor to i-beam
;; (modify-all-frames-parameters (list (cons 'cursor-type 'bar)))
;; tab, space, indentation settings
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq c-default-style "linux" c-basic-offset 4)
;; replace yes/no to y/n, easy answer is better to me
(defalias 'yes-or-no-p 'y-or-n-p)
;; (setq display-time-24hr-format t)
;; hippie-expand setting
(setq hippie-expand-try-functions-list
  '(try-expand-dabbrev
    try-expand-dabbrev-all-buffers
    ;; try-expand-dabbrev-from-kill
    ;; try-expand-all-abbrevs
    ;; try-expand-list
    ;; try-expand-line
    try-complete-lisp-symbol-partially
    try-complete-lisp-symbol
    try-complete-file-name-partially
    try-complete-file-name))


;; -------------------- setup plugins --------------------
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
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; open bookmark menu at startup
;; (require 'bookmark)
;; (bookmark-bmenu-list)
;; (switch-to-buffer "*Bookmark List*")
(require 'cnfonts)
;; 让 cnfonts 随着 Emacs 自动生效。
(cnfonts-enable)
;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
;; (cnfonts-set-spacemacs-fallback-fonts)
  
;; setup solarized dark color theme
(require 'color-theme-sanityinc-solarized)
(color-theme-sanityinc-solarized-dark)

