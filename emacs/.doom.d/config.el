;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Salman Hossain"
      user-mail-address "salmanhossain500@gmail.com")

(setenv "LANG" "en_US.UTF-8")
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; Try "Fira Mono for Powerline" font

;; (setq doom-font (font-spec :family "OperatorMono Nerd Font" :size 16))

(setq doom-font (font-spec :family "Office Code Pro" :size 16))
;; (font-spec :family "Office Code Pro Regular" :size 16)
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-palenight)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(after! solaire-mode (solaire-global-mode -1))
(define-key global-map (kbd "C-,") 'previous-buffer)
(define-key global-map (kbd "C-.") 'next-buffer)
;;(setq dired-guess-shell-alist-user '(("\\.pdf\\'" "evince")))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (add-hook 'after-init-hook #'global-emojify-mode)
;; (add-hook 'after-init-hook #'golden-ratio-mode)
(setq load-prefer-newer t)

(add-hook 'python-mode-hook
          (lambda ()
            (blacken-mode)
            ;;(lsp-deferred)
            ;;(lsp-ui-sideline)
            ;;(anaconda-mode)
            ;;(anaconda-eldoc-mode)
            ;;(importmagic-mode)
            ;;(local-set-key (kbd "C-x C-d") 'anaconda-mode-show-doc)
            ;;(local-set-key (kbd "C-x C-w") 'anaconda-mode-find-definitions)
            ;;(add-hook 'before-save-hook 'pyimport-remove-unused)
            ;;(add-hook 'before-save-hook 'importmagic-fix-imports)
            ;;(add-hook 'before-save-hook 'pyimpsort-buffer)
            ))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :custom-face
  (lsp-ui-doc-background ((t (:background nil))))
  (lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic)))))
  :bind (:map lsp-ui-mode-map
         ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
         ([remap xref-find-references] . lsp-ui-peek-find-references)
         ("C-c u" . lsp-ui-imenu))
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-border (face-foreground 'default))
  (lsp-ui-sideline-enable nil)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-code-actions nil)
  :config
  ;; Use lsp-ui-doc-webkit only in GUI
  (setq lsp-ui-doc-use-webkit nil)
  ;; WORKAROUND Hide mode-line of the lsp-ui-imenu buffer
  ;; https://github.com/emacs-lsp/lsp-ui/issues/243
  (defadvice lsp-ui-imenu (after hide-lsp-ui-imenu-mode-line activate)
    (setq mode-line-format nil)))

(setq doom-themes-treemacs-theme "doom-colors")

(defvar my-posframe-buffer " *my-posframe-buffer*")

;; babel stuff
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (C . t)))

(require 'url)

(defun insert-image-from-url (&optional url)
  (interactive)
  (unless url (setq url (url-get-url-at-point)))
  (unless url
    (error "Couldn't find URL."))
  (let ((buffer (url-retrieve-synchronously url)))
    (unwind-protect
         (let ((data (with-current-buffer buffer
                       (goto-char (point-min))
                       (search-forward "\n\n")
                       (buffer-substring (point) (point-max)))))
           (insert-image (create-image data nil t)))
      (kill-buffer buffer))))

(use-package org-bullets
 :custom
 (org-bullets-bullet-list '("◉" "◆" "○" "▶" "✸" "✜"))
 (org-ellipsis " ▾")
 :hook (org-mode . org-bullets-mode))

(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.0)
                (org-level-3 . 1.0)
                (org-level-4 . 1.0)
                (org-level-5 . 1.0)))
  (set-face-attribute (car face) nil :font "Consolas" :weight 'regular :height (cdr face)))

(font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(org-indent-mode)
(variable-pitch-mode 1)
(visual-line-mode 1)

(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-bullets-mode . efs/org-mode-visual-fill))

(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(setq org-refile-targets
      '(("archives.org" :maxlevel . 1)
        ("agenda.org" :maxlevel . 1)))

(advice-add 'org-refile :after 'org-save-all-org-buffers)

;; makes minibuffer in the middle of emacs
(ivy-posframe-mode 0)

(setq org-confirm-babel-evaluate nil)

(require 'org-tempo)


(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python :results output"))
(add-to-list 'org-structure-template-alist '("cc" . "src C"))

(setq org-babel-default-header-args:C '((:includes . "<string.h> <stdio.h>")))
(setq org-babel-default-header-args:C++ '((:includes . "<bits/stdc++.h>")
                                          (:flags . "-std=c++20")
                                          (:namespaces . "std")))

(defun bind-exit-insert-mode (first-key second-key)
    "Add binding to exit insert mode using FIRST-KEY followed by SECOND-KEY."
    (define-key evil-insert-state-map (char-to-string first-key)
    #'maybe-exit)
    (evil-define-command maybe-exit ()
    :repeat change
    (interactive)
    (let ((modified (buffer-modified-p)))
        (insert (char-to-string first-key))
        (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
                               nil 0.5)))
        (cond
        ((null evt) (message ""))
        ((and (integerp evt) (char-equal evt second-key))
            (delete-char -1)
            (set-buffer-modified-p modified)
            (push 'escape unread-command-events))
        (t (setq unread-command-events (append unread-command-events
                                               (list evt)))))))))

(doom/set-frame-opacity 100)

;; (add-to-list 'default-frame-alist '(internal-border-width . 0))

;; This if for c programming commenting

(defun c-begin-comment-box ()
  "Insert the beginning of a comment, followed by a string of asterisks."
  (interactive)
  (insert "/************************************************\n"))

(defun c-end-comment-box ()
"Insert a string of asterisks, followed by the end of a comment."
(interactive)
(insert "************************************************/\n"))

;; for full screen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; allow org-roam-v2
(setq org-roam-v2-ack t)
(setq org-roam-directory "/home/salman1567/org/roam")

;; python language server https://github.com/hlissner/doom-emacs/issues/2600

(use-package! lsp
  :init
  (setq lsp-pyls-plugins-pylint-enabled t)
  (setq lsp-pyls-plugins-autopep8-enabled nil)
  (setq lsp-pyls-plugins-yapf-enabled t)
  (setq lsp-pyls-plugins-pyflakes-enabled nil)
)



;; Zotero and bibtex integration
;; https://rgoswami.me/posts/org-note-workflow/

(setq
 bibtex-completion-notes-path "/home/salman1567/Documents/bib-notes"
 bibtex-completion-bibliography "/home/salman1567/Documents/masterLib.lib"
 bibtex-completion-pdf-field "file"
 bibtex-completion-notes-template-multiple-files
 (concat
  "#+TITLE: ${title}\n"
  "#+ROAM_KEY: cite:${=key=}\n"
  "* TODO Notes\n"
  ":PROPERTIES:\n"
  ":Custom_ID: ${=key=}\n"
  ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
  ":AUTHOR: ${author-abbrev}\n"
  ":JOURNAL: ${journaltitle}\n"
  ":DATE: ${date}\n"
  ":YEAR: ${year}\n"
  ":DOI: ${doi}\n"
  ":URL: ${url}\n"
  ":END:\n\n"
  )
 )

;; make references matter more
(use-package org-ref
    :config
    (setq
         org-ref-completion-library 'org-ref-ivy-cite
         org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex
         org-ref-default-bibliography (list "/home/salman1567/Documents/masterLib.bib")
         org-ref-bibliography-notes "/home/salman1567/Documents/bib-notes/bibnotes.org"
         org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
         org-ref-notes-directory "/home/salman1566/Documents/bib-notes/"
         org-ref-notes-function 'orb-edit-notes
    ))

(use-package org-roam
  :hook (org-load . org-roam-mode)
  :commands (org-roam-buffer-toggle-display
             org-roam-find-file
             org-roam-graph
             org-roam-insert
             org-roam-switch-to-buffer
             org-roam-dailies-date
             org-roam-dailies-today
             org-roam-dailies-tomorrow
             org-roam-dailies-yesterday)
  :preface
  ;; Set this to nil so we can later detect whether the user has set a custom
  ;; directory for it, and default to `org-directory' if they haven't.
  (defvar org-roam-directory nil)
  :init
  :config
  (setq org-roam-directory (expand-file-name (or org-roam-directory "roam")
                                             org-directory)
        org-roam-verbose nil  ; https://youtu.be/fn4jIlFwuLU
        org-roam-buffer-no-delete-other-windows t ; make org-roam buffer sticky
        org-roam-completion-system 'default
)


  ;; Normally, the org-roam buffer doesn't open until you explicitly call
  ;; `org-roam'. If `+org-roam-open-buffer-on-find-file' is non-nil, the
  ;; org-roam buffer will be opened for you when you use `org-roam-find-file'
  ;; (but not `find-file', to limit the scope of this behavior).
  (add-hook 'find-file-hook
    (defun +org-roam-open-buffer-maybe-h ()
      (and +org-roam-open-buffer-on-find-file
           (memq 'org-roam-buffer--update-maybe post-command-hook)
           (not (window-parameter nil 'window-side)) ; don't proc for popups
           (not (eq 'visible (org-roam-buffer--visibility)))
           (with-current-buffer (window-buffer)
             (org-roam-buffer--get-create)))))

  ;; Hide the mode line in the org-roam buffer, since it serves no purpose. This
  ;; makes it easier to distinguish among other org buffers.
  (add-hook 'org-roam-buffer-prepare-hook #'hide-mode-line-mode))



;; Since the org module lazy loads org-protocol (waits until an org URL is
;; detected), we can safely chain `org-roam-protocol' to it.
(use-package org-roam-protocol
  :after org-protocol)

;; Set line numbers to relative
(setq display-line-numbers 'relative)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
;; (use-package pdf-view
;;   :hook (pdf-tools-enabled . pdf-view-midnight-minor-mode)
;;   :hook (pdf-tools-enabled . hide-mode-line-mode)
;;   :config
;;   (setq pdf-view-midnight-colors '("#ABB2BF" . "#282C35")))

;; automatically save buffers after 10 seconds
;; (run-with-timer 10 10 (lambda () (save-some-buffers t)))
(add-hook! 'focus-out-hook (save-some-buffers t))

;; beacon to show where cursor is
(beacon-mode 1)

;; keymaping magit commands
(map! :leader
      :desc "Magit push"
      "g p" #'magit-push)

(ivy-posframe-mode t)
(setq tide-server-max-response-length 2147483647)
