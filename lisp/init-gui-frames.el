;; Suppress GUI features
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

;; Show a marker in the left fringe for lines not in the buffer
(setq indicate-empty-lines t)

;; NO tool bar
(if (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
;; no scroll bar
(if (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))
;; no menu bar
(if (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; 显示当前行
(global-hl-line-mode t)

;; 关闭emacs的提示声音，移到第一行或者最后一行的时候
(setq ring-bell-function 'ignore)

;; 寻找匹配括号
(defadvice show-paren-function (around fix-show-paren-function activate)
   (cond ((looking-at-p "\\s(") ad-do-it)
 	(t (save-excursion
 	     (ignore-errors (backward-up-list))
 	     ad-do-it)))
   )

(add-hook 'emacs-list-mode-hook 'show-paren-mode)

;; 删掉选中的模块
(delete-selection-mode t)

;; 代码缩进
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

(global-set-key (kbd "<f5>") 'recentf-open-files)

(provide 'init-gui-frames)
