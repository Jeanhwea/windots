;;
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(initial-frame-alist (quote ((width . 150) (height . 50))))
 '(package-archives (quote (("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (chinese-fonts-setup color-theme-sanityinc-solarized)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(require 'chinese-fonts-setup)
;; 让 chinese-fonts-setup 随着 emacs 自动生效。
(chinese-fonts-setup-enable)
;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
(cfs-set-spacemacs-fallback-fonts)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
