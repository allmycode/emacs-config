(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; BASIC TWEAKS
;; Turn off startup screen
(setq inhibit-startup-message t)


;; ================================
;; IDO Mode
;;
(ido-mode 1)
(ido-everywhere 1)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)


;; ================================
;; PATH variables for Mac OS
;; add /usr/local/bin and $HOME/bin
(when (eq system-type 'darwin)
  (let ((path (getenv "PATH"))
	(home-bin (concat (getenv "HOME") "/bin"))
	(local-bin "/usr/local/bin"))
    (setenv "PATH" (concat path ":" local-bin ":" home-bin))    
    (setq exec-path (append exec-path (list local-bin home-bin)))))


;; ================================
;; SMARTPARENS MODE
;;
;; Need package smartparens
(require 'smartparens-config)
(customize-set-variable 'sp-base-key-bindings 'sp)
(add-hook 'lisp-mode-hook #'smartparens-mode)
(add-hook 'emacs-lisp-mode-hook #'smartparens-mode)



;; ================================
;; ELM-MODE
(add-hook 'elm-mode-hook #'smartparens-mode)
(add-hook 'elm-mode-hook #'rainbow-delimiters-mode)
(add-hook 'elm-mode-hook #'highlight-parentheses-mode)

;; ================================
;; JAVA-MODE
(add-hook 'java-mode-hook #'highlight-parentheses-mode)
(add-hook 'java-mode-hook #'smartparens-mode)
(add-hook 'java-mode-hook #'rainbow-delimiters-mode)


;; ================================
;; BACKUPS
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default-input-method "russian-computer")
 '(package-selected-packages
   (quote
    (rainbow-delimiters highlight-parentheses smartparens haskell-mode elm-mode ido-ubiquitous))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#eeeeec" :foreground "#2e3436" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "nil" :family "Menlo")))))
