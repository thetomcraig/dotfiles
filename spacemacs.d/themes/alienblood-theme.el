;;; alienblood-theme.el --- A low contrast color theme for Emacs.

;; Copyright (C) 2011-2017 Bozhidar Batsov

;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: http://github.com/bbatsov/alienblood-emacs
;; Version: 2.5

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A port of the popular Vim theme alienblood for Emacs 24+, built on top
;; of the new built-in theme support in Emacs 24.

;;; Credits:

;; Jani Nurminen created the original theme for vim on which this port
;; is based.

;;; Code:

(deftheme alienblood "The alienblood color theme")

(defgroup alienblood-theme nil
  "alienblood theme."
  :prefix "alienblood-theme-"
  :link '(url-link :tag "GitHub" "http://github.com/bbatsov/alienblood-emacs")
  :tag "alienblood theme")

;;;###autoload
(defcustom alienblood-override-colors-alist '()
  "Place to override default theme colors.

You can override a subset of the theme's default colors by
defining them in this alist."
  :group 'alienblood-theme
  :type '(alist
          :key-type (string :tag "Name")
          :value-type (string :tag " Hex")))

;;; Color Palette

       ;define Ansi_0_Color #112616
       ;define Ansi_1_Color #7f2b27
       ;define Ansi_10_Color #18e000
       ;define Ansi_11_Color #bde000
       ;define Ansi_12_Color #00aae0
       ;define Ansi_13_Color #0058e0
       ;define Ansi_14_Color #00e0c4
       ;define Ansi_15_Color #73fa91
       ;define Ansi_2_Color #2f7e25
       ;define Ansi_3_Color #717f24
       ;define Ansi_4_Color #2f6a7f
       ;define Ansi_5_Color #47587f
       ;define Ansi_6_Color #327f77
       ;define Ansi_7_Color #647d75
       ;define Ansi_8_Color #3c4812
       ;define Ansi_9_Color #e08009
       ;define Background_Color #0f1610
       ;define Bold_Color #7afa87
       ;define Cursor_Color #73fa91
       ;define Cursor_Text_Color #0f1610
       ;define Foreground_Color #637d75
       ;define Selected_Text_Color #73fa91
       ;define Selection_Color #1d4125


(defvar alienblood-default-colors-alist
  '(("alienblood-fg+1"     . "#FFFFEF")
    ("alienblood-fg"       . "#DCDCCC")
    ("alienblood-fg-1"     . "#656555")
    ("alienblood-bg-2"     . "#000087")
    ("alienblood-bg-1"     . "#000087")
    ("alienblood-bg-05"    . "#000087")
    ("alienblood-bg"       . "#000087")
    ("alienblood-bg+05"    . "#000087")
    ("alienblood-bg+1"     . "#000087")
    ("alienblood-bg+2"     . "#000087")
    ("alienblood-bg+3"     . "#000087")
    ("alienblood-red+1"    . "#DCA3A3")
    ("alienblood-red"      . "#CC9393")
    ("alienblood-red-1"    . "#BC8383")
    ("alienblood-red-2"    . "#AC7373")
    ("alienblood-red-3"    . "#9C6363")
    ("alienblood-red-4"    . "#8C5353")
    ("alienblood-orange"   . "#DFAF8F")
    ("alienblood-yellow"   . "#F0DFAF")
    ("alienblood-yellow-1" . "#E0CF9F")
    ("alienblood-yellow-2" . "#D0BF8F")
    ("alienblood-green-1"  . "#5F7F5F")
    ("alienblood-green"    . "#7F9F7F")
    ("alienblood-green+1"  . "#8FB28F")
    ("alienblood-green+2"  . "#9FC59F")
    ("alienblood-green+3"  . "#AFD8AF")
    ("alienblood-green+4"  . "#BFEBBF")
    ("alienblood-cyan"     . "#93E0E3")
    ("alienblood-blue+1"   . "#94BFF3")
    ("alienblood-blue"     . "#8CD0D3")
    ("alienblood-blue-1"   . "#7CB8BB")
    ("alienblood-blue-2"   . "#6CA0A3")
    ("alienblood-blue-3"   . "#5C888B")
    ("alienblood-blue-4"   . "#4C7073")
    ("alienblood-blue-5"   . "#366060")
    ("alienblood-magenta"  . "#DC8CC3"))
  "List of alienblood colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defmacro alienblood-with-color-variables (&rest body)
  "`let' bind all colors defined in `alienblood-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   (append alienblood-default-colors-alist
                           alienblood-override-colors-alist)))
     ,@body))

;;; Theme Faces
(alienblood-with-color-variables
  (custom-theme-set-faces
   'alienblood
;;;; Built-in
;;;;; basic coloring
   '(button ((t (:underline t))))
   `(link ((t (:foreground ,alienblood-yellow :underline t :weight bold))))
   `(link-visited ((t (:foreground ,alienblood-yellow-2 :underline t :weight normal))))
   `(default ((t (:foreground ,alienblood-fg :background ,alienblood-bg))))
   `(cursor ((t (:foreground ,alienblood-fg :background ,alienblood-fg+1))))
   `(escape-glyph ((t (:foreground ,alienblood-yellow :weight bold))))
   `(fringe ((t (:foreground ,alienblood-fg :background ,alienblood-bg+1))))
   `(header-line ((t (:foreground ,alienblood-yellow
                                  :background ,alienblood-bg-1
                                  :box (:line-width -1 :style released-button)))))
   `(highlight ((t (:background ,alienblood-bg-05))))
   `(success ((t (:foreground ,alienblood-green :weight bold))))
   `(warning ((t (:foreground ,alienblood-orange :weight bold))))
   `(tooltip ((t (:foreground ,alienblood-fg :background ,alienblood-bg+1))))
;;;;; compilation
   `(compilation-column-face ((t (:foreground ,alienblood-yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,alienblood-green))))
   `(compilation-error-face ((t (:foreground ,alienblood-red-1 :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,alienblood-fg))))
   `(compilation-info-face ((t (:foreground ,alienblood-blue))))
   `(compilation-info ((t (:foreground ,alienblood-green+4 :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,alienblood-green))))
   `(compilation-line-face ((t (:foreground ,alienblood-yellow))))
   `(compilation-line-number ((t (:foreground ,alienblood-yellow))))
   `(compilation-message-face ((t (:foreground ,alienblood-blue))))
   `(compilation-warning-face ((t (:foreground ,alienblood-orange :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,alienblood-green+2 :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,alienblood-red :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,alienblood-yellow :weight bold))))
;;;;; completions
   `(completions-annotations ((t (:foreground ,alienblood-fg-1))))
;;;;; eww
   '(eww-invalid-certificate ((t (:inherit error))))
   '(eww-valid-certificate   ((t (:inherit success))))
;;;;; grep
   `(grep-context-face ((t (:foreground ,alienblood-fg))))
   `(grep-error-face ((t (:foreground ,alienblood-red-1 :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,alienblood-blue))))
   `(grep-match-face ((t (:foreground ,alienblood-orange :weight bold))))
   `(match ((t (:background ,alienblood-bg-1 :foreground ,alienblood-orange :weight bold))))
;;;;; hi-lock
   `(hi-blue    ((t (:background ,alienblood-cyan    :foreground ,alienblood-bg-1))))
   `(hi-green   ((t (:background ,alienblood-green+4 :foreground ,alienblood-bg-1))))
   `(hi-pink    ((t (:background ,alienblood-magenta :foreground ,alienblood-bg-1))))
   `(hi-yellow  ((t (:background ,alienblood-yellow  :foreground ,alienblood-bg-1))))
   `(hi-blue-b  ((t (:foreground ,alienblood-blue    :weight     bold))))
   `(hi-green-b ((t (:foreground ,alienblood-green+2 :weight     bold))))
   `(hi-red-b   ((t (:foreground ,alienblood-red     :weight     bold))))
;;;;; info
   `(Info-quoted ((t (:inherit font-lock-constant-face))))
;;;;; isearch
   `(isearch ((t (:foreground ,alienblood-yellow-2 :weight bold :background ,alienblood-bg+2))))
   `(isearch-fail ((t (:foreground ,alienblood-fg :background ,alienblood-red-4))))
   `(lazy-highlight ((t (:foreground ,alienblood-yellow-2 :weight bold :background ,alienblood-bg-05))))

   `(menu ((t (:foreground ,alienblood-fg :background ,alienblood-bg))))
   `(minibuffer-prompt ((t (:foreground ,alienblood-yellow))))
   `(mode-line
     ((,class (:foreground ,alienblood-green+1
                           :background ,alienblood-bg-1
                           :box (:line-width -1 :style released-button)))
      (t :inverse-video t)))
   `(mode-line-buffer-id ((t (:foreground ,alienblood-yellow :weight bold))))
   `(mode-line-inactive
     ((t (:foreground ,alienblood-green-1
                      :background ,alienblood-bg-05
                      :box (:line-width -1 :style released-button)))))
   `(region ((,class (:background ,alienblood-bg-1))
             (t :inverse-video t)))
   `(secondary-selection ((t (:background ,alienblood-bg+2))))
   `(trailing-whitespace ((t (:background ,alienblood-red))))
   `(vertical-border ((t (:foreground ,alienblood-fg))))
;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,alienblood-fg :weight bold))))
   `(font-lock-comment-face ((t (:foreground ,alienblood-green))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,alienblood-green-1))))
   `(font-lock-constant-face ((t (:foreground ,alienblood-green+4))))
   `(font-lock-doc-face ((t (:foreground ,alienblood-green+2))))
   `(font-lock-function-name-face ((t (:foreground ,alienblood-cyan))))
   `(font-lock-keyword-face ((t (:foreground ,alienblood-yellow :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,alienblood-yellow :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,alienblood-blue+1))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,alienblood-yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,alienblood-green :weight bold))))
   `(font-lock-string-face ((t (:foreground ,alienblood-red))))
   `(font-lock-type-face ((t (:foreground ,alienblood-blue-1))))
   `(font-lock-variable-name-face ((t (:foreground ,alienblood-orange))))
   `(font-lock-warning-face ((t (:foreground ,alienblood-yellow-2 :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
;;;;; man
   '(Man-overstrike ((t (:inherit font-lock-keyword-face))))
   '(Man-underline  ((t (:inherit (font-lock-string-face underline)))))
;;;;; newsticker
   `(newsticker-date-face ((t (:foreground ,alienblood-fg))))
   `(newsticker-default-face ((t (:foreground ,alienblood-fg))))
   `(newsticker-enclosure-face ((t (:foreground ,alienblood-green+3))))
   `(newsticker-extra-face ((t (:foreground ,alienblood-bg+2 :height 0.8))))
   `(newsticker-feed-face ((t (:foreground ,alienblood-fg))))
   `(newsticker-immortal-item-face ((t (:foreground ,alienblood-green))))
   `(newsticker-new-item-face ((t (:foreground ,alienblood-blue))))
   `(newsticker-obsolete-item-face ((t (:foreground ,alienblood-red))))
   `(newsticker-old-item-face ((t (:foreground ,alienblood-bg+3))))
   `(newsticker-statistics-face ((t (:foreground ,alienblood-fg))))
   `(newsticker-treeview-face ((t (:foreground ,alienblood-fg))))
   `(newsticker-treeview-immortal-face ((t (:foreground ,alienblood-green))))
   `(newsticker-treeview-listwindow-face ((t (:foreground ,alienblood-fg))))
   `(newsticker-treeview-new-face ((t (:foreground ,alienblood-blue :weight bold))))
   `(newsticker-treeview-obsolete-face ((t (:foreground ,alienblood-red))))
   `(newsticker-treeview-old-face ((t (:foreground ,alienblood-bg+3))))
   `(newsticker-treeview-selection-face ((t (:background ,alienblood-bg-1 :foreground ,alienblood-yellow))))
;;;;; woman
   '(woman-bold   ((t (:inherit font-lock-keyword-face))))
   '(woman-italic ((t (:inherit (font-lock-string-face italic)))))
;;;; Third-party
;;;;; ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,alienblood-fg-1 :background ,alienblood-bg :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,alienblood-green+2 :background ,alienblood-bg :inverse-video nil))))
;;;;; ace-window
   `(aw-background-face
     ((t (:foreground ,alienblood-fg-1 :background ,alienblood-bg :inverse-video nil))))
   `(aw-leading-char-face ((t (:inherit aw-mode-line-face))))
;;;;; android mode
   `(android-mode-debug-face ((t (:foreground ,alienblood-green+1))))
   `(android-mode-error-face ((t (:foreground ,alienblood-orange :weight bold))))
   `(android-mode-info-face ((t (:foreground ,alienblood-fg))))
   `(android-mode-verbose-face ((t (:foreground ,alienblood-green))))
   `(android-mode-warning-face ((t (:foreground ,alienblood-yellow))))
;;;;; anzu
   `(anzu-mode-line ((t (:foreground ,alienblood-cyan :weight bold))))
   `(anzu-mode-line-no-match ((t (:foreground ,alienblood-red :weight bold))))
   `(anzu-match-1 ((t (:foreground ,alienblood-bg :background ,alienblood-green))))
   `(anzu-match-2 ((t (:foreground ,alienblood-bg :background ,alienblood-orange))))
   `(anzu-match-3 ((t (:foreground ,alienblood-bg :background ,alienblood-blue))))
   `(anzu-replace-to ((t (:inherit anzu-replace-highlight :foreground ,alienblood-yellow))))
;;;;; auctex
   `(font-latex-bold-face ((t (:inherit bold))))
   `(font-latex-warning-face ((t (:foreground nil :inherit font-lock-warning-face))))
   `(font-latex-sectioning-5-face ((t (:foreground ,alienblood-red :weight bold ))))
   `(font-latex-sedate-face ((t (:foreground ,alienblood-yellow))))
   `(font-latex-italic-face ((t (:foreground ,alienblood-cyan :slant italic))))
   `(font-latex-string-face ((t (:inherit ,font-lock-string-face))))
   `(font-latex-math-face ((t (:foreground ,alienblood-orange))))
   `(font-latex-script-char-face ((t (:foreground ,alienblood-orange))))
;;;;; agda-mode
   `(agda2-highlight-keyword-face ((t (:foreground ,alienblood-yellow :weight bold))))
   `(agda2-highlight-string-face ((t (:foreground ,alienblood-red))))
   `(agda2-highlight-symbol-face ((t (:foreground ,alienblood-orange))))
   `(agda2-highlight-primitive-type-face ((t (:foreground ,alienblood-blue-1))))
   `(agda2-highlight-inductive-constructor-face ((t (:foreground ,alienblood-fg))))
   `(agda2-highlight-coinductive-constructor-face ((t (:foreground ,alienblood-fg))))
   `(agda2-highlight-datatype-face ((t (:foreground ,alienblood-blue))))
   `(agda2-highlight-function-face ((t (:foreground ,alienblood-blue))))
   `(agda2-highlight-module-face ((t (:foreground ,alienblood-blue-1))))
   `(agda2-highlight-error-face ((t (:foreground ,alienblood-bg :background ,alienblood-magenta))))
   `(agda2-highlight-unsolved-meta-face ((t (:foreground ,alienblood-bg :background ,alienblood-magenta))))
   `(agda2-highlight-unsolved-constraint-face ((t (:foreground ,alienblood-bg :background ,alienblood-magenta))))
   `(agda2-highlight-termination-problem-face ((t (:foreground ,alienblood-bg :background ,alienblood-magenta))))
   `(agda2-highlight-incomplete-pattern-face ((t (:foreground ,alienblood-bg :background ,alienblood-magenta))))
   `(agda2-highlight-typechecks-face ((t (:background ,alienblood-red-4))))
;;;;; auto-complete
   `(ac-candidate-face ((t (:background ,alienblood-bg+3 :foreground ,alienblood-bg-2))))
   `(ac-selection-face ((t (:background ,alienblood-blue-4 :foreground ,alienblood-fg))))
   `(popup-tip-face ((t (:background ,alienblood-yellow-2 :foreground ,alienblood-bg-2))))
   `(popup-menu-mouse-face ((t (:background ,alienblood-yellow-2 :foreground ,alienblood-bg-2))))
   `(popup-summary-face ((t (:background ,alienblood-bg+3 :foreground ,alienblood-bg-2))))
   `(popup-scroll-bar-foreground-face ((t (:background ,alienblood-blue-5))))
   `(popup-scroll-bar-background-face ((t (:background ,alienblood-bg-1))))
   `(popup-isearch-match ((t (:background ,alienblood-bg :foreground ,alienblood-fg))))
;;;;; avy
   `(avy-background-face
     ((t (:foreground ,alienblood-fg-1 :background ,alienblood-bg :inverse-video nil))))
   `(avy-lead-face-0
     ((t (:foreground ,alienblood-green+3 :background ,alienblood-bg :inverse-video nil :weight bold))))
   `(avy-lead-face-1
     ((t (:foreground ,alienblood-yellow :background ,alienblood-bg :inverse-video nil :weight bold))))
   `(avy-lead-face-2
     ((t (:foreground ,alienblood-red+1 :background ,alienblood-bg :inverse-video nil :weight bold))))
   `(avy-lead-face
     ((t (:foreground ,alienblood-cyan :background ,alienblood-bg :inverse-video nil :weight bold))))
;;;;; company-mode
   `(company-tooltip ((t (:foreground ,alienblood-fg :background ,alienblood-bg+1))))
   `(company-tooltip-annotation ((t (:foreground ,alienblood-orange :background ,alienblood-bg+1))))
   `(company-tooltip-annotation-selection ((t (:foreground ,alienblood-orange :background ,alienblood-bg-1))))
   `(company-tooltip-selection ((t (:foreground ,alienblood-fg :background ,alienblood-bg-1))))
   `(company-tooltip-mouse ((t (:background ,alienblood-bg-1))))
   `(company-tooltip-common ((t (:foreground ,alienblood-green+2))))
   `(company-tooltip-common-selection ((t (:foreground ,alienblood-green+2))))
   `(company-scrollbar-fg ((t (:background ,alienblood-bg-1))))
   `(company-scrollbar-bg ((t (:background ,alienblood-bg+2))))
   `(company-preview ((t (:background ,alienblood-green+2))))
   `(company-preview-common ((t (:foreground ,alienblood-green+2 :background ,alienblood-bg-1))))
;;;;; bm
   `(bm-face ((t (:background ,alienblood-yellow-1 :foreground ,alienblood-bg))))
   `(bm-fringe-face ((t (:background ,alienblood-yellow-1 :foreground ,alienblood-bg))))
   `(bm-fringe-persistent-face ((t (:background ,alienblood-green-1 :foreground ,alienblood-bg))))
   `(bm-persistent-face ((t (:background ,alienblood-green-1 :foreground ,alienblood-bg))))
;;;;; calfw
   `(cfw:face-annotation ((t (:foreground ,alienblood-red :inherit cfw:face-day-title))))
   `(cfw:face-day-title ((t nil)))
   `(cfw:face-default-content ((t (:foreground ,alienblood-green))))
   `(cfw:face-default-day ((t (:weight bold))))
   `(cfw:face-disable ((t (:foreground ,alienblood-fg-1))))
   `(cfw:face-grid ((t (:inherit shadow))))
   `(cfw:face-header ((t (:inherit font-lock-keyword-face))))
   `(cfw:face-holiday ((t (:inherit cfw:face-sunday))))
   `(cfw:face-periods ((t (:foreground ,alienblood-cyan))))
   `(cfw:face-saturday ((t (:foreground ,alienblood-blue :weight bold))))
   `(cfw:face-select ((t (:background ,alienblood-blue-5))))
   `(cfw:face-sunday ((t (:foreground ,alienblood-red :weight bold))))
   `(cfw:face-title ((t (:height 2.0 :inherit (variable-pitch font-lock-keyword-face)))))
   `(cfw:face-today ((t (:foreground ,alienblood-cyan :weight bold))))
   `(cfw:face-today-title ((t (:inherit highlight bold))))
   `(cfw:face-toolbar ((t (:background ,alienblood-blue-5))))
   `(cfw:face-toolbar-button-off ((t (:underline nil :inherit link))))
   `(cfw:face-toolbar-button-on ((t (:underline nil :inherit link-visited))))
;;;;; cider
   `(cider-result-overlay-face ((t (:background unspecified))))
   `(cider-enlightened-face ((t (:box (:color ,alienblood-orange :line-width -1)))))
   `(cider-enlightened-local-face ((t (:weight bold :foreground ,alienblood-green+1))))
   `(cider-deprecated-face ((t (:background ,alienblood-yellow-2))))
   `(cider-instrumented-face ((t (:box (:color ,alienblood-red :line-width -1)))))
   `(cider-traced-face ((t (:box (:color ,alienblood-cyan :line-width -1)))))
   `(cider-test-failure-face ((t (:background ,alienblood-red-4))))
   `(cider-test-error-face ((t (:background ,alienblood-magenta))))
   `(cider-test-success-face ((t (:background ,alienblood-green-1))))
   `(cider-fringe-good-face ((t (:foreground ,alienblood-green+4))))
;;;;; circe
   `(circe-highlight-nick-face ((t (:foreground ,alienblood-cyan))))
   `(circe-my-message-face ((t (:foreground ,alienblood-fg))))
   `(circe-fool-face ((t (:foreground ,alienblood-red+1))))
   `(circe-topic-diff-removed-face ((t (:foreground ,alienblood-red :weight bold))))
   `(circe-originator-face ((t (:foreground ,alienblood-fg))))
   `(circe-server-face ((t (:foreground ,alienblood-green))))
   `(circe-topic-diff-new-face ((t (:foreground ,alienblood-orange :weight bold))))
   `(circe-prompt-face ((t (:foreground ,alienblood-orange :background ,alienblood-bg :weight bold))))
;;;;; context-coloring
   `(context-coloring-level-0-face ((t :foreground ,alienblood-fg)))
   `(context-coloring-level-1-face ((t :foreground ,alienblood-cyan)))
   `(context-coloring-level-2-face ((t :foreground ,alienblood-green+4)))
   `(context-coloring-level-3-face ((t :foreground ,alienblood-yellow)))
   `(context-coloring-level-4-face ((t :foreground ,alienblood-orange)))
   `(context-coloring-level-5-face ((t :foreground ,alienblood-magenta)))
   `(context-coloring-level-6-face ((t :foreground ,alienblood-blue+1)))
   `(context-coloring-level-7-face ((t :foreground ,alienblood-green+2)))
   `(context-coloring-level-8-face ((t :foreground ,alienblood-yellow-2)))
   `(context-coloring-level-9-face ((t :foreground ,alienblood-red+1)))
;;;;; coq
   `(coq-solve-tactics-face ((t (:foreground nil :inherit font-lock-constant-face))))
;;;;; ctable
   `(ctbl:face-cell-select ((t (:background ,alienblood-blue :foreground ,alienblood-bg))))
   `(ctbl:face-continue-bar ((t (:background ,alienblood-bg-05 :foreground ,alienblood-bg))))
   `(ctbl:face-row-select ((t (:background ,alienblood-cyan :foreground ,alienblood-bg))))
;;;;; debbugs
   `(debbugs-gnu-done ((t (:foreground ,alienblood-fg-1))))
   `(debbugs-gnu-handled ((t (:foreground ,alienblood-green))))
   `(debbugs-gnu-new ((t (:foreground ,alienblood-red))))
   `(debbugs-gnu-pending ((t (:foreground ,alienblood-blue))))
   `(debbugs-gnu-stale ((t (:foreground ,alienblood-orange))))
   `(debbugs-gnu-tagged ((t (:foreground ,alienblood-red))))
;;;;; diff
   `(diff-added          ((t (:background "#335533" :foreground ,alienblood-green))))
   `(diff-changed        ((t (:background "#555511" :foreground ,alienblood-yellow-1))))
   `(diff-removed        ((t (:background "#553333" :foreground ,alienblood-red-2))))
   `(diff-refine-added   ((t (:background "#338833" :foreground ,alienblood-green+4))))
   `(diff-refine-change  ((t (:background "#888811" :foreground ,alienblood-yellow))))
   `(diff-refine-removed ((t (:background "#883333" :foreground ,alienblood-red))))
   `(diff-header ((,class (:background ,alienblood-bg+2))
                  (t (:background ,alienblood-fg :foreground ,alienblood-bg))))
   `(diff-file-header
     ((,class (:background ,alienblood-bg+2 :foreground ,alienblood-fg :weight bold))
      (t (:background ,alienblood-fg :foreground ,alienblood-bg :weight bold))))
;;;;; diff-hl
   `(diff-hl-change ((,class (:foreground ,alienblood-blue :background ,alienblood-blue-2))))
   `(diff-hl-delete ((,class (:foreground ,alienblood-red+1 :background ,alienblood-red-1))))
   `(diff-hl-insert ((,class (:foreground ,alienblood-green+1 :background ,alienblood-green-1))))
;;;;; dim-autoload
   `(dim-autoload-cookie-line ((t :foreground ,alienblood-bg+1)))
;;;;; dired+
   `(diredp-display-msg ((t (:foreground ,alienblood-blue))))
   `(diredp-compressed-file-suffix ((t (:foreground ,alienblood-orange))))
   `(diredp-date-time ((t (:foreground ,alienblood-magenta))))
   `(diredp-deletion ((t (:foreground ,alienblood-yellow))))
   `(diredp-deletion-file-name ((t (:foreground ,alienblood-red))))
   `(diredp-dir-heading ((t (:foreground ,alienblood-blue :background ,alienblood-bg-1))))
   `(diredp-dir-priv ((t (:foreground ,alienblood-cyan))))
   `(diredp-exec-priv ((t (:foreground ,alienblood-red))))
   `(diredp-executable-tag ((t (:foreground ,alienblood-green+1))))
   `(diredp-file-name ((t (:foreground ,alienblood-blue))))
   `(diredp-file-suffix ((t (:foreground ,alienblood-green))))
   `(diredp-flag-mark ((t (:foreground ,alienblood-yellow))))
   `(diredp-flag-mark-line ((t (:foreground ,alienblood-orange))))
   `(diredp-ignored-file-name ((t (:foreground ,alienblood-red))))
   `(diredp-link-priv ((t (:foreground ,alienblood-yellow))))
   `(diredp-mode-line-flagged ((t (:foreground ,alienblood-yellow))))
   `(diredp-mode-line-marked ((t (:foreground ,alienblood-orange))))
   `(diredp-no-priv ((t (:foreground ,alienblood-fg))))
   `(diredp-number ((t (:foreground ,alienblood-green+1))))
   `(diredp-other-priv ((t (:foreground ,alienblood-yellow-1))))
   `(diredp-rare-priv ((t (:foreground ,alienblood-red-1))))
   `(diredp-read-priv ((t (:foreground ,alienblood-green-1))))
   `(diredp-symlink ((t (:foreground ,alienblood-yellow))))
   `(diredp-write-priv ((t (:foreground ,alienblood-magenta))))
;;;;; dired-async
   `(dired-async-failures ((t (:foreground ,alienblood-red :weight bold))))
   `(dired-async-message ((t (:foreground ,alienblood-yellow :weight bold))))
   `(dired-async-mode-message ((t (:foreground ,alienblood-yellow))))
;;;;; ediff
   `(ediff-current-diff-A ((t (:foreground ,alienblood-fg :background ,alienblood-red-4))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,alienblood-fg :background ,alienblood-red-4))))
   `(ediff-current-diff-B ((t (:foreground ,alienblood-fg :background ,alienblood-green-1))))
   `(ediff-current-diff-C ((t (:foreground ,alienblood-fg :background ,alienblood-blue-5))))
   `(ediff-even-diff-A ((t (:background ,alienblood-bg+1))))
   `(ediff-even-diff-Ancestor ((t (:background ,alienblood-bg+1))))
   `(ediff-even-diff-B ((t (:background ,alienblood-bg+1))))
   `(ediff-even-diff-C ((t (:background ,alienblood-bg+1))))
   `(ediff-fine-diff-A ((t (:foreground ,alienblood-fg :background ,alienblood-red-2 :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,alienblood-fg :background ,alienblood-red-2 weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,alienblood-fg :background ,alienblood-green :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,alienblood-fg :background ,alienblood-blue-3 :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,alienblood-bg+2))))
   `(ediff-odd-diff-Ancestor ((t (:background ,alienblood-bg+2))))
   `(ediff-odd-diff-B ((t (:background ,alienblood-bg+2))))
   `(ediff-odd-diff-C ((t (:background ,alienblood-bg+2))))
;;;;; egg
   `(egg-text-base ((t (:foreground ,alienblood-fg))))
   `(egg-help-header-1 ((t (:foreground ,alienblood-yellow))))
   `(egg-help-header-2 ((t (:foreground ,alienblood-green+3))))
   `(egg-branch ((t (:foreground ,alienblood-yellow))))
   `(egg-branch-mono ((t (:foreground ,alienblood-yellow))))
   `(egg-term ((t (:foreground ,alienblood-yellow))))
   `(egg-diff-add ((t (:foreground ,alienblood-green+4))))
   `(egg-diff-del ((t (:foreground ,alienblood-red+1))))
   `(egg-diff-file-header ((t (:foreground ,alienblood-yellow-2))))
   `(egg-section-title ((t (:foreground ,alienblood-yellow))))
   `(egg-stash-mono ((t (:foreground ,alienblood-green+4))))
;;;;; elfeed
   `(elfeed-log-error-level-face ((t (:foreground ,alienblood-red))))
   `(elfeed-log-info-level-face ((t (:foreground ,alienblood-blue))))
   `(elfeed-log-warn-level-face ((t (:foreground ,alienblood-yellow))))
   `(elfeed-search-date-face ((t (:foreground ,alienblood-yellow-1 :underline t
                                              :weight bold))))
   `(elfeed-search-tag-face ((t (:foreground ,alienblood-green))))
   `(elfeed-search-feed-face ((t (:foreground ,alienblood-cyan))))
;;;;; emacs-w3m
   `(w3m-anchor ((t (:foreground ,alienblood-yellow :underline t
                                 :weight bold))))
   `(w3m-arrived-anchor ((t (:foreground ,alienblood-yellow-2
                                         :underline t :weight normal))))
   `(w3m-form ((t (:foreground ,alienblood-red-1 :underline t))))
   `(w3m-header-line-location-title ((t (:foreground ,alienblood-yellow
                                                     :underline t :weight bold))))
   '(w3m-history-current-url ((t (:inherit match))))
   `(w3m-lnum ((t (:foreground ,alienblood-green+2 :background ,alienblood-bg))))
   `(w3m-lnum-match ((t (:background ,alienblood-bg-1
                                     :foreground ,alienblood-orange
                                     :weight bold))))
   `(w3m-lnum-minibuffer-prompt ((t (:foreground ,alienblood-yellow))))
;;;;; erc
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,alienblood-blue :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-default-face ((t (:foreground ,alienblood-fg))))
   `(erc-direct-msg-face ((t (:inherit erc-default-face))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit erc-default-face))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,alienblood-yellow))))
   `(erc-keyword-face ((t (:foreground ,alienblood-blue :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,alienblood-yellow :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,alienblood-red :weight bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default-face))))
   `(erc-notice-face ((t (:foreground ,alienblood-green))))
   `(erc-pal-face ((t (:foreground ,alienblood-orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,alienblood-orange :background ,alienblood-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,alienblood-green+4))))
   `(erc-underline-face ((t (:underline t))))
;;;;; eros
   `(eros-result-overlay-face ((t (:background unspecified))))
;;;;; ert
   `(ert-test-result-expected ((t (:foreground ,alienblood-green+4 :background ,alienblood-bg))))
   `(ert-test-result-unexpected ((t (:foreground ,alienblood-red :background ,alienblood-bg))))
;;;;; eshell
   `(eshell-prompt ((t (:foreground ,alienblood-yellow :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,alienblood-red-1 :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,alienblood-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,alienblood-red+1 :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,alienblood-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,alienblood-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,alienblood-cyan :weight bold))))
;;;;; flx
   `(flx-highlight-face ((t (:foreground ,alienblood-green+2 :weight bold))))
;;;;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alienblood-red-1) :inherit unspecified))
      (t (:foreground ,alienblood-red-1 :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alienblood-yellow) :inherit unspecified))
      (t (:foreground ,alienblood-yellow :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alienblood-cyan) :inherit unspecified))
      (t (:foreground ,alienblood-cyan :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,alienblood-red-1 :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,alienblood-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,alienblood-cyan :weight bold))))
;;;;; flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alienblood-red)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,alienblood-red-1 :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alienblood-orange)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,alienblood-orange :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alienblood-green)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,alienblood-green-1 :weight bold :underline t))))
;;;;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alienblood-orange) :inherit unspecified))
      (t (:foreground ,alienblood-orange :weight bold :underline t))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alienblood-red) :inherit unspecified))
      (t (:foreground ,alienblood-red-1 :weight bold :underline t))))
;;;;; full-ack
   `(ack-separator ((t (:foreground ,alienblood-fg))))
   `(ack-file ((t (:foreground ,alienblood-blue))))
   `(ack-line ((t (:foreground ,alienblood-yellow))))
   `(ack-match ((t (:foreground ,alienblood-orange :background ,alienblood-bg-1 :weight bold))))
;;;;; git-annex
   '(git-annex-dired-annexed-available ((t (:inherit success :weight normal))))
   '(git-annex-dired-annexed-unavailable ((t (:inherit error :weight normal))))
;;;;; git-commit
   `(git-commit-comment-action  ((,class (:foreground ,alienblood-green+1 :weight bold))))
   `(git-commit-comment-branch  ((,class (:foreground ,alienblood-blue+1  :weight bold)))) ; obsolete
   `(git-commit-comment-branch-local  ((,class (:foreground ,alienblood-blue+1  :weight bold))))
   `(git-commit-comment-branch-remote ((,class (:foreground ,alienblood-green  :weight bold))))
   `(git-commit-comment-heading ((,class (:foreground ,alienblood-yellow  :weight bold))))
;;;;; git-gutter
   `(git-gutter:added ((t (:foreground ,alienblood-green :weight bold :inverse-video t))))
   `(git-gutter:deleted ((t (:foreground ,alienblood-red :weight bold :inverse-video t))))
   `(git-gutter:modified ((t (:foreground ,alienblood-magenta :weight bold :inverse-video t))))
   `(git-gutter:unchanged ((t (:foreground ,alienblood-fg :weight bold :inverse-video t))))
;;;;; git-gutter-fr
   `(git-gutter-fr:added ((t (:foreground ,alienblood-green  :weight bold))))
   `(git-gutter-fr:deleted ((t (:foreground ,alienblood-red :weight bold))))
   `(git-gutter-fr:modified ((t (:foreground ,alienblood-magenta :weight bold))))
;;;;; git-rebase
   `(git-rebase-hash ((t (:foreground, alienblood-orange))))
;;;;; gnus
   `(gnus-group-mail-1 ((t (:weight bold :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((t (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((t (:weight bold :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((t (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((t (:weight bold :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((t (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((t (:weight bold :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((t (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((t (:weight bold :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((t (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((t (:weight bold :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((t (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((t (:weight bold :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((t (:weight bold :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((t (:weight bold :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((t (:weight bold :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((t (:weight bold :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((t (:weight bold :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((t (:weight bold :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((t (:weight bold :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((t (:inherit message-header-other))))
   `(gnus-header-from ((t (:inherit message-header-to))))
   `(gnus-header-name ((t (:inherit message-header-name))))
   `(gnus-header-newsgroups ((t (:inherit message-header-other))))
   `(gnus-header-subject ((t (:inherit message-header-subject))))
   `(gnus-server-opened ((t (:foreground ,alienblood-green+2 :weight bold))))
   `(gnus-server-denied ((t (:foreground ,alienblood-red+1 :weight bold))))
   `(gnus-server-closed ((t (:foreground ,alienblood-blue :slant italic))))
   `(gnus-server-offline ((t (:foreground ,alienblood-yellow :weight bold))))
   `(gnus-server-agent ((t (:foreground ,alienblood-blue :weight bold))))
   `(gnus-summary-cancelled ((t (:foreground ,alienblood-orange))))
   `(gnus-summary-high-ancient ((t (:foreground ,alienblood-blue))))
   `(gnus-summary-high-read ((t (:foreground ,alienblood-green :weight bold))))
   `(gnus-summary-high-ticked ((t (:foreground ,alienblood-orange :weight bold))))
   `(gnus-summary-high-unread ((t (:foreground ,alienblood-fg :weight bold))))
   `(gnus-summary-low-ancient ((t (:foreground ,alienblood-blue))))
   `(gnus-summary-low-read ((t (:foreground ,alienblood-green))))
   `(gnus-summary-low-ticked ((t (:foreground ,alienblood-orange :weight bold))))
   `(gnus-summary-low-unread ((t (:foreground ,alienblood-fg))))
   `(gnus-summary-normal-ancient ((t (:foreground ,alienblood-blue))))
   `(gnus-summary-normal-read ((t (:foreground ,alienblood-green))))
   `(gnus-summary-normal-ticked ((t (:foreground ,alienblood-orange :weight bold))))
   `(gnus-summary-normal-unread ((t (:foreground ,alienblood-fg))))
   `(gnus-summary-selected ((t (:foreground ,alienblood-yellow :weight bold))))
   `(gnus-cite-1 ((t (:foreground ,alienblood-blue))))
   `(gnus-cite-10 ((t (:foreground ,alienblood-yellow-1))))
   `(gnus-cite-11 ((t (:foreground ,alienblood-yellow))))
   `(gnus-cite-2 ((t (:foreground ,alienblood-blue-1))))
   `(gnus-cite-3 ((t (:foreground ,alienblood-blue-2))))
   `(gnus-cite-4 ((t (:foreground ,alienblood-green+2))))
   `(gnus-cite-5 ((t (:foreground ,alienblood-green+1))))
   `(gnus-cite-6 ((t (:foreground ,alienblood-green))))
   `(gnus-cite-7 ((t (:foreground ,alienblood-red))))
   `(gnus-cite-8 ((t (:foreground ,alienblood-red-1))))
   `(gnus-cite-9 ((t (:foreground ,alienblood-red-2))))
   `(gnus-group-news-1-empty ((t (:foreground ,alienblood-yellow))))
   `(gnus-group-news-2-empty ((t (:foreground ,alienblood-green+3))))
   `(gnus-group-news-3-empty ((t (:foreground ,alienblood-green+1))))
   `(gnus-group-news-4-empty ((t (:foreground ,alienblood-blue-2))))
   `(gnus-group-news-5-empty ((t (:foreground ,alienblood-blue-3))))
   `(gnus-group-news-6-empty ((t (:foreground ,alienblood-bg+2))))
   `(gnus-group-news-low-empty ((t (:foreground ,alienblood-bg+2))))
   `(gnus-signature ((t (:foreground ,alienblood-yellow))))
   `(gnus-x ((t (:background ,alienblood-fg :foreground ,alienblood-bg))))
   `(mm-uu-extract ((t (:background ,alienblood-bg-05 :foreground ,alienblood-green+1))))
;;;;; go-guru
   `(go-guru-hl-identifier-face ((t (:foreground ,alienblood-bg-1 :background ,alienblood-green+1))))
;;;;; guide-key
   `(guide-key/highlight-command-face ((t (:foreground ,alienblood-blue))))
   `(guide-key/key-face ((t (:foreground ,alienblood-green))))
   `(guide-key/prefix-command-face ((t (:foreground ,alienblood-green+1))))
;;;;; hackernews
   '(hackernews-comment-count ((t (:inherit link-visited :underline nil))))
   '(hackernews-link          ((t (:inherit link         :underline nil))))
;;;;; helm
   `(helm-header
     ((t (:foreground ,alienblood-green
                      :background ,alienblood-bg
                      :underline nil
                      :box nil))))
   `(helm-source-header
     ((t (:foreground ,alienblood-yellow
                      :background ,alienblood-bg-1
                      :underline nil
                      :weight bold
                      :box (:line-width -1 :style released-button)))))
   `(helm-selection ((t (:background ,alienblood-bg+1 :underline nil))))
   `(helm-selection-line ((t (:background ,alienblood-bg+1))))
   `(helm-visible-mark ((t (:foreground ,alienblood-bg :background ,alienblood-yellow-2))))
   `(helm-candidate-number ((t (:foreground ,alienblood-green+4 :background ,alienblood-bg-1))))
   `(helm-separator ((t (:foreground ,alienblood-red :background ,alienblood-bg))))
   `(helm-time-zone-current ((t (:foreground ,alienblood-green+2 :background ,alienblood-bg))))
   `(helm-time-zone-home ((t (:foreground ,alienblood-red :background ,alienblood-bg))))
   `(helm-bookmark-addressbook ((t (:foreground ,alienblood-orange :background ,alienblood-bg))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,alienblood-magenta :background ,alienblood-bg))))
   `(helm-bookmark-info ((t (:foreground ,alienblood-green+2 :background ,alienblood-bg))))
   `(helm-bookmark-man ((t (:foreground ,alienblood-yellow :background ,alienblood-bg))))
   `(helm-bookmark-w3m ((t (:foreground ,alienblood-magenta :background ,alienblood-bg))))
   `(helm-buffer-not-saved ((t (:foreground ,alienblood-red :background ,alienblood-bg))))
   `(helm-buffer-process ((t (:foreground ,alienblood-cyan :background ,alienblood-bg))))
   `(helm-buffer-saved-out ((t (:foreground ,alienblood-fg :background ,alienblood-bg))))
   `(helm-buffer-size ((t (:foreground ,alienblood-fg-1 :background ,alienblood-bg))))
   `(helm-ff-directory ((t (:foreground ,alienblood-cyan :background ,alienblood-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,alienblood-fg :background ,alienblood-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,alienblood-green+2 :background ,alienblood-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,alienblood-red :background ,alienblood-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,alienblood-yellow :background ,alienblood-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,alienblood-bg :background ,alienblood-yellow :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,alienblood-cyan :background ,alienblood-bg))))
   `(helm-grep-file ((t (:foreground ,alienblood-fg :background ,alienblood-bg))))
   `(helm-grep-finish ((t (:foreground ,alienblood-green+2 :background ,alienblood-bg))))
   `(helm-grep-lineno ((t (:foreground ,alienblood-fg-1 :background ,alienblood-bg))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,alienblood-red :background ,alienblood-bg))))
   `(helm-match ((t (:foreground ,alienblood-orange :background ,alienblood-bg-1 :weight bold))))
   `(helm-moccur-buffer ((t (:foreground ,alienblood-cyan :background ,alienblood-bg))))
   `(helm-mu-contacts-address-face ((t (:foreground ,alienblood-fg-1 :background ,alienblood-bg))))
   `(helm-mu-contacts-name-face ((t (:foreground ,alienblood-fg :background ,alienblood-bg))))
;;;;; helm-swoop
   `(helm-swoop-target-line-face ((t (:foreground ,alienblood-fg :background ,alienblood-bg+1))))
   `(helm-swoop-target-word-face ((t (:foreground ,alienblood-yellow :background ,alienblood-bg+2 :weight bold))))
;;;;; hl-line-mode
   `(hl-line-face ((,class (:background ,alienblood-bg-05))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,alienblood-bg-05)) ; old emacsen
              (t :weight bold)))
;;;;; hl-sexp
   `(hl-sexp-face ((,class (:background ,alienblood-bg+1))
                   (t :weight bold)))
;;;;; hydra
   `(hydra-face-red ((t (:foreground ,alienblood-red-1 :background ,alienblood-bg))))
   `(hydra-face-amaranth ((t (:foreground ,alienblood-red-3 :background ,alienblood-bg))))
   `(hydra-face-blue ((t (:foreground ,alienblood-blue :background ,alienblood-bg))))
   `(hydra-face-pink ((t (:foreground ,alienblood-magenta :background ,alienblood-bg))))
   `(hydra-face-teal ((t (:foreground ,alienblood-cyan :background ,alienblood-bg))))
;;;;; info+
   `(info-command-ref-item ((t (:background ,alienblood-bg-1 :foreground ,alienblood-orange))))
   `(info-constant-ref-item ((t (:background ,alienblood-bg-1 :foreground ,alienblood-magenta))))
   `(info-double-quoted-name ((t (:inherit font-lock-comment-face))))
   `(info-file ((t (:background ,alienblood-bg-1 :foreground ,alienblood-yellow))))
   `(info-function-ref-item ((t (:background ,alienblood-bg-1 :inherit font-lock-function-name-face))))
   `(info-macro-ref-item ((t (:background ,alienblood-bg-1 :foreground ,alienblood-yellow))))
   `(info-menu ((t (:foreground ,alienblood-yellow))))
   `(info-quoted-name ((t (:inherit font-lock-constant-face))))
   `(info-reference-item ((t (:background ,alienblood-bg-1))))
   `(info-single-quote ((t (:inherit font-lock-keyword-face))))
   `(info-special-form-ref-item ((t (:background ,alienblood-bg-1 :foreground ,alienblood-yellow))))
   `(info-string ((t (:inherit font-lock-string-face))))
   `(info-syntax-class-item ((t (:background ,alienblood-bg-1 :foreground ,alienblood-blue+1))))
   `(info-user-option-ref-item ((t (:background ,alienblood-bg-1 :foreground ,alienblood-red))))
   `(info-variable-ref-item ((t (:background ,alienblood-bg-1 :foreground ,alienblood-orange))))
;;;;; irfc
   `(irfc-head-name-face ((t (:foreground ,alienblood-red :weight bold))))
   `(irfc-head-number-face ((t (:foreground ,alienblood-red :weight bold))))
   `(irfc-reference-face ((t (:foreground ,alienblood-blue-1 :weight bold))))
   `(irfc-requirement-keyword-face ((t (:inherit font-lock-keyword-face))))
   `(irfc-rfc-link-face ((t (:inherit link))))
   `(irfc-rfc-number-face ((t (:foreground ,alienblood-cyan :weight bold))))
   `(irfc-std-number-face ((t (:foreground ,alienblood-green+4 :weight bold))))
   `(irfc-table-item-face ((t (:foreground ,alienblood-green+3))))
   `(irfc-title-face ((t (:foreground ,alienblood-yellow
                                      :underline t :weight bold))))
;;;;; ivy
   `(ivy-confirm-face ((t (:foreground ,alienblood-green :background ,alienblood-bg))))
   `(ivy-current-match ((t (:foreground ,alienblood-yellow :weight bold :underline t))))
   `(ivy-cursor ((t (:foreground ,alienblood-bg :background ,alienblood-fg))))
   `(ivy-match-required-face ((t (:foreground ,alienblood-red :background ,alienblood-bg))))
   `(ivy-minibuffer-match-face-1 ((t (:background ,alienblood-bg+1))))
   `(ivy-minibuffer-match-face-2 ((t (:background ,alienblood-green-1))))
   `(ivy-minibuffer-match-face-3 ((t (:background ,alienblood-green))))
   `(ivy-minibuffer-match-face-4 ((t (:background ,alienblood-green+1))))
   `(ivy-remote ((t (:foreground ,alienblood-blue :background ,alienblood-bg))))
   `(ivy-subdir ((t (:foreground ,alienblood-yellow :background ,alienblood-bg))))
;;;;; ido-mode
   `(ido-first-match ((t (:foreground ,alienblood-yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,alienblood-orange :weight bold))))
   `(ido-subdir ((t (:foreground ,alienblood-yellow))))
   `(ido-indicator ((t (:foreground ,alienblood-yellow :background ,alienblood-red-4))))
;;;;; iedit-mode
   `(iedit-occurrence ((t (:background ,alienblood-bg+2 :weight bold))))
;;;;; jabber-mode
   `(jabber-roster-user-away ((t (:foreground ,alienblood-green+2))))
   `(jabber-roster-user-online ((t (:foreground ,alienblood-blue-1))))
   `(jabber-roster-user-dnd ((t (:foreground ,alienblood-red+1))))
   `(jabber-roster-user-xa ((t (:foreground ,alienblood-magenta))))
   `(jabber-roster-user-chatty ((t (:foreground ,alienblood-orange))))
   `(jabber-roster-user-error ((t (:foreground ,alienblood-red+1))))
   `(jabber-rare-time-face ((t (:foreground ,alienblood-green+1))))
   `(jabber-chat-prompt-local ((t (:foreground ,alienblood-blue-1))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,alienblood-red+1))))
   `(jabber-chat-prompt-system ((t (:foreground ,alienblood-green+3))))
   `(jabber-activity-face((t (:foreground ,alienblood-red+1))))
   `(jabber-activity-personal-face ((t (:foreground ,alienblood-blue+1))))
   `(jabber-title-small ((t (:height 1.1 :weight bold))))
   `(jabber-title-medium ((t (:height 1.2 :weight bold))))
   `(jabber-title-large ((t (:height 1.3 :weight bold))))
;;;;; js2-mode
   `(js2-warning ((t (:underline ,alienblood-orange))))
   `(js2-error ((t (:foreground ,alienblood-red :weight bold))))
   `(js2-jsdoc-tag ((t (:foreground ,alienblood-green-1))))
   `(js2-jsdoc-type ((t (:foreground ,alienblood-green+2))))
   `(js2-jsdoc-value ((t (:foreground ,alienblood-green+3))))
   `(js2-function-param ((t (:foreground, alienblood-orange))))
   `(js2-external-variable ((t (:foreground ,alienblood-orange))))
;;;;; additional js2 mode attributes for better syntax highlighting
   `(js2-instance-member ((t (:foreground ,alienblood-green-1))))
   `(js2-jsdoc-html-tag-delimiter ((t (:foreground ,alienblood-orange))))
   `(js2-jsdoc-html-tag-name ((t (:foreground ,alienblood-red-1))))
   `(js2-object-property ((t (:foreground ,alienblood-blue+1))))
   `(js2-magic-paren ((t (:foreground ,alienblood-blue-5))))
   `(js2-private-function-call ((t (:foreground ,alienblood-cyan))))
   `(js2-function-call ((t (:foreground ,alienblood-cyan))))
   `(js2-private-member ((t (:foreground ,alienblood-blue-1))))
   `(js2-keywords ((t (:foreground ,alienblood-magenta))))
;;;;; ledger-mode
   `(ledger-font-payee-uncleared-face ((t (:foreground ,alienblood-red-1 :weight bold))))
   `(ledger-font-payee-cleared-face ((t (:foreground ,alienblood-fg :weight normal))))
   `(ledger-font-payee-pending-face ((t (:foreground ,alienblood-red :weight normal))))
   `(ledger-font-xact-highlight-face ((t (:background ,alienblood-bg+1))))
   `(ledger-font-auto-xact-face ((t (:foreground ,alienblood-yellow-1 :weight normal))))
   `(ledger-font-periodic-xact-face ((t (:foreground ,alienblood-green :weight normal))))
   `(ledger-font-pending-face ((t (:foreground ,alienblood-orange weight: normal))))
   `(ledger-font-other-face ((t (:foreground ,alienblood-fg))))
   `(ledger-font-posting-date-face ((t (:foreground ,alienblood-orange :weight normal))))
   `(ledger-font-posting-account-face ((t (:foreground ,alienblood-blue-1))))
   `(ledger-font-posting-account-cleared-face ((t (:foreground ,alienblood-fg))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,alienblood-orange))))
   `(ledger-font-posting-amount-face ((t (:foreground ,alienblood-orange))))
   `(ledger-occur-narrowed-face ((t (:foreground ,alienblood-fg-1 :invisible t))))
   `(ledger-occur-xact-face ((t (:background ,alienblood-bg+1))))
   `(ledger-font-comment-face ((t (:foreground ,alienblood-green))))
   `(ledger-font-reconciler-uncleared-face ((t (:foreground ,alienblood-red-1 :weight bold))))
   `(ledger-font-reconciler-cleared-face ((t (:foreground ,alienblood-fg :weight normal))))
   `(ledger-font-reconciler-pending-face ((t (:foreground ,alienblood-orange :weight normal))))
   `(ledger-font-report-clickable-face ((t (:foreground ,alienblood-orange :weight normal))))
;;;;; linum-mode
   `(linum ((t (:foreground ,alienblood-green+2 :background ,alienblood-bg))))
;;;;; lispy
   `(lispy-command-name-face ((t (:background ,alienblood-bg-05 :inherit font-lock-function-name-face))))
   `(lispy-cursor-face ((t (:foreground ,alienblood-bg :background ,alienblood-fg))))
   `(lispy-face-hint ((t (:inherit highlight :foreground ,alienblood-yellow))))
;;;;; ruler-mode
   `(ruler-mode-column-number ((t (:inherit 'ruler-mode-default :foreground ,alienblood-fg))))
   `(ruler-mode-fill-column ((t (:inherit 'ruler-mode-default :foreground ,alienblood-yellow))))
   `(ruler-mode-goal-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-comment-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-tab-stop ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-current-column ((t (:foreground ,alienblood-yellow :box t))))
   `(ruler-mode-default ((t (:foreground ,alienblood-green+2 :background ,alienblood-bg))))

;;;;; lui
   `(lui-time-stamp-face ((t (:foreground ,alienblood-blue-1))))
   `(lui-hilight-face ((t (:foreground ,alienblood-green+2 :background ,alienblood-bg))))
   `(lui-button-face ((t (:inherit hover-highlight))))
;;;;; macrostep
   `(macrostep-gensym-1
     ((t (:foreground ,alienblood-green+2 :background ,alienblood-bg-1))))
   `(macrostep-gensym-2
     ((t (:foreground ,alienblood-red+1 :background ,alienblood-bg-1))))
   `(macrostep-gensym-3
     ((t (:foreground ,alienblood-blue+1 :background ,alienblood-bg-1))))
   `(macrostep-gensym-4
     ((t (:foreground ,alienblood-magenta :background ,alienblood-bg-1))))
   `(macrostep-gensym-5
     ((t (:foreground ,alienblood-yellow :background ,alienblood-bg-1))))
   `(macrostep-expansion-highlight-face
     ((t (:inherit highlight))))
   `(macrostep-macro-face
     ((t (:underline t))))
;;;;; magit
;;;;;; headings and diffs
   `(magit-section-highlight           ((t (:background ,alienblood-bg+05))))
   `(magit-section-heading             ((t (:foreground ,alienblood-yellow :weight bold))))
   `(magit-section-heading-selection   ((t (:foreground ,alienblood-orange :weight bold))))

   `(magit-diff-added-highlight ((t (:background ,alienblood-green))))
   `(magit-diff-removed-highlight ((t (:background ,alienblood-red-3))))
   `(magit-diff-added ((t (:background ,alienblood-green-1))))
   `(magit-diff-removed ((t (:background ,alienblood-red-4))))

   `(magit-diff-file-heading           ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,alienblood-bg+05  :weight bold))))
   `(magit-diff-file-heading-selection ((t (:background ,alienblood-bg+05
                                                        :foreground ,alienblood-orange :weight bold))))
   `(magit-diff-hunk-heading           ((t (:background ,alienblood-bg+1))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,alienblood-bg+2))))
   `(magit-diff-hunk-heading-selection ((t (:background ,alienblood-bg+2
                                                        :foreground ,alienblood-orange))))
   `(magit-diff-lines-heading          ((t (:background ,alienblood-orange
                                                        :foreground ,alienblood-bg+2))))
   `(magit-diff-context-highlight      ((t (:background ,alienblood-bg+05
                                                        :foreground "grey70"))))
   `(magit-diffstat-added   ((t (:foreground ,alienblood-green+4))))
   `(magit-diffstat-removed ((t (:foreground ,alienblood-red))))
;;;;;; popup
   `(magit-popup-heading             ((t (:foreground ,alienblood-yellow  :weight bold))))
   `(magit-popup-key                 ((t (:foreground ,alienblood-green-1 :weight bold))))
   `(magit-popup-argument            ((t (:foreground ,alienblood-green   :weight bold))))
   `(magit-popup-disabled-argument   ((t (:foreground ,alienblood-fg-1    :weight normal))))
   `(magit-popup-option-value        ((t (:foreground ,alienblood-blue-2  :weight bold))))
;;;;;; process
   `(magit-process-ok    ((t (:foreground ,alienblood-green  :weight bold))))
   `(magit-process-ng    ((t (:foreground ,alienblood-red    :weight bold))))
;;;;;; log
   `(magit-log-author    ((t (:foreground ,alienblood-orange))))
   `(magit-log-date      ((t (:foreground ,alienblood-fg-1))))
   `(magit-log-graph     ((t (:foreground ,alienblood-fg+1))))
;;;;;; sequence
   `(magit-sequence-pick ((t (:foreground ,alienblood-yellow-2))))
   `(magit-sequence-stop ((t (:foreground ,alienblood-green))))
   `(magit-sequence-part ((t (:foreground ,alienblood-yellow))))
   `(magit-sequence-head ((t (:foreground ,alienblood-blue))))
   `(magit-sequence-drop ((t (:foreground ,alienblood-red))))
   `(magit-sequence-done ((t (:foreground ,alienblood-fg-1))))
   `(magit-sequence-onto ((t (:foreground ,alienblood-fg-1))))
;;;;;; bisect
   `(magit-bisect-good ((t (:foreground ,alienblood-green))))
   `(magit-bisect-skip ((t (:foreground ,alienblood-yellow))))
   `(magit-bisect-bad  ((t (:foreground ,alienblood-red))))
;;;;;; blame
   `(magit-blame-heading ((t (:background ,alienblood-bg-1 :foreground ,alienblood-blue-2))))
   `(magit-blame-hash    ((t (:background ,alienblood-bg-1 :foreground ,alienblood-blue-2))))
   `(magit-blame-name    ((t (:background ,alienblood-bg-1 :foreground ,alienblood-orange))))
   `(magit-blame-date    ((t (:background ,alienblood-bg-1 :foreground ,alienblood-orange))))
   `(magit-blame-summary ((t (:background ,alienblood-bg-1 :foreground ,alienblood-blue-2
                                          :weight bold))))
;;;;;; references etc
   `(magit-dimmed         ((t (:foreground ,alienblood-bg+3))))
   `(magit-hash           ((t (:foreground ,alienblood-bg+3))))
   `(magit-tag            ((t (:foreground ,alienblood-orange :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,alienblood-green  :weight bold))))
   `(magit-branch-local   ((t (:foreground ,alienblood-blue   :weight bold))))
   `(magit-branch-current ((t (:foreground ,alienblood-blue   :weight bold :box t))))
   `(magit-head           ((t (:foreground ,alienblood-blue   :weight bold))))
   `(magit-refname        ((t (:background ,alienblood-bg+2 :foreground ,alienblood-fg :weight bold))))
   `(magit-refname-stash  ((t (:background ,alienblood-bg+2 :foreground ,alienblood-fg :weight bold))))
   `(magit-refname-wip    ((t (:background ,alienblood-bg+2 :foreground ,alienblood-fg :weight bold))))
   `(magit-signature-good      ((t (:foreground ,alienblood-green))))
   `(magit-signature-bad       ((t (:foreground ,alienblood-red))))
   `(magit-signature-untrusted ((t (:foreground ,alienblood-yellow))))
   `(magit-signature-expired   ((t (:foreground ,alienblood-orange))))
   `(magit-signature-revoked   ((t (:foreground ,alienblood-magenta))))
   '(magit-signature-error     ((t (:inherit    magit-signature-bad))))
   `(magit-cherry-unmatched    ((t (:foreground ,alienblood-cyan))))
   `(magit-cherry-equivalent   ((t (:foreground ,alienblood-magenta))))
   `(magit-reflog-commit       ((t (:foreground ,alienblood-green))))
   `(magit-reflog-amend        ((t (:foreground ,alienblood-magenta))))
   `(magit-reflog-merge        ((t (:foreground ,alienblood-green))))
   `(magit-reflog-checkout     ((t (:foreground ,alienblood-blue))))
   `(magit-reflog-reset        ((t (:foreground ,alienblood-red))))
   `(magit-reflog-rebase       ((t (:foreground ,alienblood-magenta))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,alienblood-green))))
   `(magit-reflog-remote       ((t (:foreground ,alienblood-cyan))))
   `(magit-reflog-other        ((t (:foreground ,alienblood-cyan))))
;;;;; message-mode
   `(message-cited-text ((t (:inherit font-lock-comment-face))))
   `(message-header-name ((t (:foreground ,alienblood-green+1))))
   `(message-header-other ((t (:foreground ,alienblood-green))))
   `(message-header-to ((t (:foreground ,alienblood-yellow :weight bold))))
   `(message-header-cc ((t (:foreground ,alienblood-yellow :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,alienblood-yellow :weight bold))))
   `(message-header-subject ((t (:foreground ,alienblood-orange :weight bold))))
   `(message-header-xheader ((t (:foreground ,alienblood-green))))
   `(message-mml ((t (:foreground ,alienblood-yellow :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment-face))))
;;;;; mew
   `(mew-face-header-subject ((t (:foreground ,alienblood-orange))))
   `(mew-face-header-from ((t (:foreground ,alienblood-yellow))))
   `(mew-face-header-date ((t (:foreground ,alienblood-green))))
   `(mew-face-header-to ((t (:foreground ,alienblood-red))))
   `(mew-face-header-key ((t (:foreground ,alienblood-green))))
   `(mew-face-header-private ((t (:foreground ,alienblood-green))))
   `(mew-face-header-important ((t (:foreground ,alienblood-blue))))
   `(mew-face-header-marginal ((t (:foreground ,alienblood-fg :weight bold))))
   `(mew-face-header-warning ((t (:foreground ,alienblood-red))))
   `(mew-face-header-xmew ((t (:foreground ,alienblood-green))))
   `(mew-face-header-xmew-bad ((t (:foreground ,alienblood-red))))
   `(mew-face-body-url ((t (:foreground ,alienblood-orange))))
   `(mew-face-body-comment ((t (:foreground ,alienblood-fg :slant italic))))
   `(mew-face-body-cite1 ((t (:foreground ,alienblood-green))))
   `(mew-face-body-cite2 ((t (:foreground ,alienblood-blue))))
   `(mew-face-body-cite3 ((t (:foreground ,alienblood-orange))))
   `(mew-face-body-cite4 ((t (:foreground ,alienblood-yellow))))
   `(mew-face-body-cite5 ((t (:foreground ,alienblood-red))))
   `(mew-face-mark-review ((t (:foreground ,alienblood-blue))))
   `(mew-face-mark-escape ((t (:foreground ,alienblood-green))))
   `(mew-face-mark-delete ((t (:foreground ,alienblood-red))))
   `(mew-face-mark-unlink ((t (:foreground ,alienblood-yellow))))
   `(mew-face-mark-refile ((t (:foreground ,alienblood-green))))
   `(mew-face-mark-unread ((t (:foreground ,alienblood-red-2))))
   `(mew-face-eof-message ((t (:foreground ,alienblood-green))))
   `(mew-face-eof-part ((t (:foreground ,alienblood-yellow))))
;;;;; mic-paren
   `(paren-face-match ((t (:foreground ,alienblood-cyan :background ,alienblood-bg :weight bold))))
   `(paren-face-mismatch ((t (:foreground ,alienblood-bg :background ,alienblood-magenta :weight bold))))
   `(paren-face-no-match ((t (:foreground ,alienblood-bg :background ,alienblood-red :weight bold))))
;;;;; mingus
   `(mingus-directory-face ((t (:foreground ,alienblood-blue))))
   `(mingus-pausing-face ((t (:foreground ,alienblood-magenta))))
   `(mingus-playing-face ((t (:foreground ,alienblood-cyan))))
   `(mingus-playlist-face ((t (:foreground ,alienblood-cyan ))))
   `(mingus-mark-face ((t (:bold t :foreground ,alienblood-magenta))))
   `(mingus-song-file-face ((t (:foreground ,alienblood-yellow))))
   `(mingus-artist-face ((t (:foreground ,alienblood-cyan))))
   `(mingus-album-face ((t (:underline t :foreground ,alienblood-red+1))))
   `(mingus-album-stale-face ((t (:foreground ,alienblood-red+1))))
   `(mingus-stopped-face ((t (:foreground ,alienblood-red))))
;;;;; nav
   `(nav-face-heading ((t (:foreground ,alienblood-yellow))))
   `(nav-face-button-num ((t (:foreground ,alienblood-cyan))))
   `(nav-face-dir ((t (:foreground ,alienblood-green))))
   `(nav-face-hdir ((t (:foreground ,alienblood-red))))
   `(nav-face-file ((t (:foreground ,alienblood-fg))))
   `(nav-face-hfile ((t (:foreground ,alienblood-red-4))))
;;;;; merlin
   `(merlin-type-face ((t (:inherit highlight))))
   `(merlin-compilation-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alienblood-orange)))
      (t
       (:underline ,alienblood-orange))))
   `(merlin-compilation-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alienblood-red)))
      (t
       (:underline ,alienblood-red))))
;;;;; mu4e
   `(mu4e-cited-1-face ((t (:foreground ,alienblood-blue    :slant italic))))
   `(mu4e-cited-2-face ((t (:foreground ,alienblood-green+2 :slant italic))))
   `(mu4e-cited-3-face ((t (:foreground ,alienblood-blue-2  :slant italic))))
   `(mu4e-cited-4-face ((t (:foreground ,alienblood-green   :slant italic))))
   `(mu4e-cited-5-face ((t (:foreground ,alienblood-blue-4  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,alienblood-green-1 :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,alienblood-blue    :slant italic))))
   `(mu4e-replied-face ((t (:foreground ,alienblood-bg+3))))
   `(mu4e-trashed-face ((t (:foreground ,alienblood-bg+3 :strike-through t))))
;;;;; mumamo
   `(mumamo-background-chunk-major ((t (:background nil))))
   `(mumamo-background-chunk-submode1 ((t (:background ,alienblood-bg-1))))
   `(mumamo-background-chunk-submode2 ((t (:background ,alienblood-bg+2))))
   `(mumamo-background-chunk-submode3 ((t (:background ,alienblood-bg+3))))
   `(mumamo-background-chunk-submode4 ((t (:background ,alienblood-bg+1))))
;;;;; neotree
   `(neo-banner-face ((t (:foreground ,alienblood-blue+1 :weight bold))))
   `(neo-header-face ((t (:foreground ,alienblood-fg))))
   `(neo-root-dir-face ((t (:foreground ,alienblood-blue+1 :weight bold))))
   `(neo-dir-link-face ((t (:foreground ,alienblood-blue))))
   `(neo-file-link-face ((t (:foreground ,alienblood-fg))))
   `(neo-expand-btn-face ((t (:foreground ,alienblood-blue))))
   `(neo-vc-default-face ((t (:foreground ,alienblood-fg+1))))
   `(neo-vc-user-face ((t (:foreground ,alienblood-red :slant italic))))
   `(neo-vc-up-to-date-face ((t (:foreground ,alienblood-fg))))
   `(neo-vc-edited-face ((t (:foreground ,alienblood-magenta))))
   `(neo-vc-needs-merge-face ((t (:foreground ,alienblood-red+1))))
   `(neo-vc-unlocked-changes-face ((t (:foreground ,alienblood-red :background ,alienblood-blue-5))))
   `(neo-vc-added-face ((t (:foreground ,alienblood-green+1))))
   `(neo-vc-conflict-face ((t (:foreground ,alienblood-red+1))))
   `(neo-vc-missing-face ((t (:foreground ,alienblood-red+1))))
   `(neo-vc-ignored-face ((t (:foreground ,alienblood-fg-1))))
;;;;; org-mode
   `(org-agenda-date-today
     ((t (:foreground ,alienblood-fg+1 :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((t (:inherit font-lock-comment-face))))
   `(org-archived ((t (:foreground ,alienblood-fg :weight bold))))
   `(org-checkbox ((t (:background ,alienblood-bg+2 :foreground ,alienblood-fg+1
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,alienblood-blue :underline t))))
   `(org-deadline-announce ((t (:foreground ,alienblood-red-1))))
   `(org-done ((t (:weight bold :weight bold :foreground ,alienblood-green+3))))
   `(org-formula ((t (:foreground ,alienblood-yellow-2))))
   `(org-headline-done ((t (:foreground ,alienblood-green+3))))
   `(org-hide ((t (:foreground ,alienblood-bg-1))))
   `(org-level-1 ((t (:foreground ,alienblood-orange))))
   `(org-level-2 ((t (:foreground ,alienblood-green+4))))
   `(org-level-3 ((t (:foreground ,alienblood-blue-1))))
   `(org-level-4 ((t (:foreground ,alienblood-yellow-2))))
   `(org-level-5 ((t (:foreground ,alienblood-cyan))))
   `(org-level-6 ((t (:foreground ,alienblood-green+2))))
   `(org-level-7 ((t (:foreground ,alienblood-red-4))))
   `(org-level-8 ((t (:foreground ,alienblood-blue-4))))
   `(org-link ((t (:foreground ,alienblood-yellow-2 :underline t))))
   `(org-scheduled ((t (:foreground ,alienblood-green+4))))
   `(org-scheduled-previously ((t (:foreground ,alienblood-red))))
   `(org-scheduled-today ((t (:foreground ,alienblood-blue+1))))
   `(org-sexp-date ((t (:foreground ,alienblood-blue+1 :underline t))))
   `(org-special-keyword ((t (:inherit font-lock-comment-face))))
   `(org-table ((t (:foreground ,alienblood-green+2))))
   `(org-tag ((t (:weight bold :weight bold))))
   `(org-time-grid ((t (:foreground ,alienblood-orange))))
   `(org-todo ((t (:weight bold :foreground ,alienblood-red :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:weight bold :foreground ,alienblood-red :weight bold :underline nil))))
   `(org-column ((t (:background ,alienblood-bg-1))))
   `(org-column-title ((t (:background ,alienblood-bg-1 :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,alienblood-fg :background ,alienblood-bg-1))))
   `(org-mode-line-clock-overrun ((t (:foreground ,alienblood-bg :background ,alienblood-red-1))))
   `(org-ellipsis ((t (:foreground ,alienblood-yellow-1 :underline t))))
   `(org-footnote ((t (:foreground ,alienblood-cyan :underline t))))
   `(org-document-title ((t (:foreground ,alienblood-blue))))
   `(org-document-info ((t (:foreground ,alienblood-blue))))
   `(org-habit-ready-face ((t :background ,alienblood-green)))
   `(org-habit-alert-face ((t :background ,alienblood-yellow-1 :foreground ,alienblood-bg)))
   `(org-habit-clear-face ((t :background ,alienblood-blue-3)))
   `(org-habit-overdue-face ((t :background ,alienblood-red-3)))
   `(org-habit-clear-future-face ((t :background ,alienblood-blue-4)))
   `(org-habit-ready-future-face ((t :background ,alienblood-green-1)))
   `(org-habit-alert-future-face ((t :background ,alienblood-yellow-2 :foreground ,alienblood-bg)))
   `(org-habit-overdue-future-face ((t :background ,alienblood-red-4)))
;;;;; outline
   `(outline-1 ((t (:foreground ,alienblood-orange))))
   `(outline-2 ((t (:foreground ,alienblood-green+4))))
   `(outline-3 ((t (:foreground ,alienblood-blue-1))))
   `(outline-4 ((t (:foreground ,alienblood-yellow-2))))
   `(outline-5 ((t (:foreground ,alienblood-cyan))))
   `(outline-6 ((t (:foreground ,alienblood-green+2))))
   `(outline-7 ((t (:foreground ,alienblood-red-4))))
   `(outline-8 ((t (:foreground ,alienblood-blue-4))))
;;;;; p4
   `(p4-depot-added-face ((t :inherit diff-added)))
   `(p4-depot-branch-op-face ((t :inherit diff-changed)))
   `(p4-depot-deleted-face ((t :inherit diff-removed)))
   `(p4-depot-unmapped-face ((t :inherit diff-changed)))
   `(p4-diff-change-face ((t :inherit diff-changed)))
   `(p4-diff-del-face ((t :inherit diff-removed)))
   `(p4-diff-file-face ((t :inherit diff-file-header)))
   `(p4-diff-head-face ((t :inherit diff-header)))
   `(p4-diff-ins-face ((t :inherit diff-added)))
;;;;; c/perl
   `(cperl-nonoverridable-face ((t (:foreground ,alienblood-magenta))))
   `(cperl-array-face ((t (:foreground ,alienblood-yellow, :backgorund ,alienblood-bg))))
   `(cperl-hash-face ((t (:foreground ,alienblood-yellow-1, :background ,alienblood-bg))))
;;;;; perspective
   `(persp-selected-face ((t (:foreground ,alienblood-yellow-2 :inherit mode-line))))
;;;;; powerline
   `(powerline-active1 ((t (:background ,alienblood-bg-05 :inherit mode-line))))
   `(powerline-active2 ((t (:background ,alienblood-bg+2 :inherit mode-line))))
   `(powerline-inactive1 ((t (:background ,alienblood-bg+1 :inherit mode-line-inactive))))
   `(powerline-inactive2 ((t (:background ,alienblood-bg+3 :inherit mode-line-inactive))))
;;;;; proofgeneral
   `(proof-active-area-face ((t (:underline t))))
   `(proof-boring-face ((t (:foreground ,alienblood-fg :background ,alienblood-bg+2))))
   `(proof-command-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-debug-message-face ((t (:inherit proof-boring-face))))
   `(proof-declaration-name-face ((t (:inherit font-lock-keyword-face :foreground nil))))
   `(proof-eager-annotation-face ((t (:foreground ,alienblood-bg :background ,alienblood-orange))))
   `(proof-error-face ((t (:foreground ,alienblood-fg :background ,alienblood-red-4))))
   `(proof-highlight-dependency-face ((t (:foreground ,alienblood-bg :background ,alienblood-yellow-1))))
   `(proof-highlight-dependent-face ((t (:foreground ,alienblood-bg :background ,alienblood-orange))))
   `(proof-locked-face ((t (:background ,alienblood-blue-5))))
   `(proof-mouse-highlight-face ((t (:foreground ,alienblood-bg :background ,alienblood-orange))))
   `(proof-queue-face ((t (:background ,alienblood-red-4))))
   `(proof-region-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-script-highlight-error-face ((t (:background ,alienblood-red-2))))
   `(proof-tacticals-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,alienblood-bg))))
   `(proof-tactics-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,alienblood-bg))))
   `(proof-warning-face ((t (:foreground ,alienblood-bg :background ,alienblood-yellow-1))))
;;;;; racket-mode
   `(racket-keyword-argument-face ((t (:inherit font-lock-constant-face))))
   `(racket-selfeval-face ((t (:inherit font-lock-type-face))))
;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,alienblood-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,alienblood-green+4))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,alienblood-yellow-2))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,alienblood-cyan))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,alienblood-green+2))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,alienblood-blue+1))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,alienblood-yellow-1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,alienblood-green+1))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,alienblood-blue-2))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,alienblood-orange))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,alienblood-green))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,alienblood-blue-5))))
;;;;; rcirc
   `(rcirc-my-nick ((t (:foreground ,alienblood-blue))))
   `(rcirc-other-nick ((t (:foreground ,alienblood-orange))))
   `(rcirc-bright-nick ((t (:foreground ,alienblood-blue+1))))
   `(rcirc-dim-nick ((t (:foreground ,alienblood-blue-2))))
   `(rcirc-server ((t (:foreground ,alienblood-green))))
   `(rcirc-server-prefix ((t (:foreground ,alienblood-green+1))))
   `(rcirc-timestamp ((t (:foreground ,alienblood-green+2))))
   `(rcirc-nick-in-message ((t (:foreground ,alienblood-yellow))))
   `(rcirc-nick-in-message-full-line ((t (:weight bold))))
   `(rcirc-prompt ((t (:foreground ,alienblood-yellow :weight bold))))
   `(rcirc-track-nick ((t (:inverse-video t))))
   `(rcirc-track-keyword ((t (:weight bold))))
   `(rcirc-url ((t (:weight bold))))
   `(rcirc-keyword ((t (:foreground ,alienblood-yellow :weight bold))))
;;;;; re-builder
   `(reb-match-0 ((t (:foreground ,alienblood-bg :background ,alienblood-magenta))))
   `(reb-match-1 ((t (:foreground ,alienblood-bg :background ,alienblood-blue))))
   `(reb-match-2 ((t (:foreground ,alienblood-bg :background ,alienblood-orange))))
   `(reb-match-3 ((t (:foreground ,alienblood-bg :background ,alienblood-red))))
;;;;; realgud
   `(realgud-overlay-arrow1 ((t (:foreground ,alienblood-green))))
   `(realgud-overlay-arrow2 ((t (:foreground ,alienblood-yellow))))
   `(realgud-overlay-arrow3 ((t (:foreground ,alienblood-orange))))
   `(realgud-bp-enabled-face ((t (:inherit error))))
   `(realgud-bp-disabled-face ((t (:inherit secondary-selection))))
   `(realgud-bp-line-enabled-face ((t (:box (:color ,alienblood-red :style nil)))))
   `(realgud-bp-line-disabled-face ((t (:box (:color "grey70" :style nil)))))
   `(realgud-line-number ((t (:foreground ,alienblood-yellow))))
   `(realgud-backtrace-number ((t (:foreground ,alienblood-yellow, :weight bold))))
;;;;; regex-tool
   `(regex-tool-matched-face ((t (:background ,alienblood-blue-4 :weight bold))))
;;;;; rpm-mode
   `(rpm-spec-dir-face ((t (:foreground ,alienblood-green))))
   `(rpm-spec-doc-face ((t (:foreground ,alienblood-green))))
   `(rpm-spec-ghost-face ((t (:foreground ,alienblood-red))))
   `(rpm-spec-macro-face ((t (:foreground ,alienblood-yellow))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground ,alienblood-red))))
   `(rpm-spec-package-face ((t (:foreground ,alienblood-red))))
   `(rpm-spec-section-face ((t (:foreground ,alienblood-yellow))))
   `(rpm-spec-tag-face ((t (:foreground ,alienblood-blue))))
   `(rpm-spec-var-face ((t (:foreground ,alienblood-red))))
;;;;; rst-mode
   `(rst-level-1-face ((t (:foreground ,alienblood-orange))))
   `(rst-level-2-face ((t (:foreground ,alienblood-green+1))))
   `(rst-level-3-face ((t (:foreground ,alienblood-blue-1))))
   `(rst-level-4-face ((t (:foreground ,alienblood-yellow-2))))
   `(rst-level-5-face ((t (:foreground ,alienblood-cyan))))
   `(rst-level-6-face ((t (:foreground ,alienblood-green-1))))
;;;;; sh-mode
   `(sh-heredoc     ((t (:foreground ,alienblood-yellow :weight bold))))
   `(sh-quoted-exec ((t (:foreground ,alienblood-red))))
;;;;; show-paren
   `(show-paren-mismatch ((t (:foreground ,alienblood-red+1 :background ,alienblood-bg+3 :weight bold))))
   `(show-paren-match ((t (:background ,alienblood-bg+3 :weight bold))))
;;;;; smart-mode-line
   ;; use (setq sml/theme nil) to enable alienblood for sml
   `(sml/global ((,class (:foreground ,alienblood-fg :weight bold))))
   `(sml/modes ((,class (:foreground ,alienblood-yellow :weight bold))))
   `(sml/minor-modes ((,class (:foreground ,alienblood-fg-1 :weight bold))))
   `(sml/filename ((,class (:foreground ,alienblood-yellow :weight bold))))
   `(sml/line-number ((,class (:foreground ,alienblood-blue :weight bold))))
   `(sml/col-number ((,class (:foreground ,alienblood-blue+1 :weight bold))))
   `(sml/position-percentage ((,class (:foreground ,alienblood-blue-1 :weight bold))))
   `(sml/prefix ((,class (:foreground ,alienblood-orange))))
   `(sml/git ((,class (:foreground ,alienblood-green+3))))
   `(sml/process ((,class (:weight bold))))
   `(sml/sudo ((,class  (:foreground ,alienblood-orange :weight bold))))
   `(sml/read-only ((,class (:foreground ,alienblood-red-2))))
   `(sml/outside-modified ((,class (:foreground ,alienblood-orange))))
   `(sml/modified ((,class (:foreground ,alienblood-red))))
   `(sml/vc-edited ((,class (:foreground ,alienblood-green+2))))
   `(sml/charging ((,class (:foreground ,alienblood-green+4))))
   `(sml/discharging ((,class (:foreground ,alienblood-red+1))))
;;;;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,alienblood-red+1 :background ,alienblood-bg+3 :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,alienblood-bg+3 :weight bold))))
;;;;; sml-mode-line
   '(sml-modeline-end-face ((t :inherit default :width condensed)))
;;;;; SLIME
   `(slime-repl-output-face ((t (:foreground ,alienblood-red))))
   `(slime-repl-inputed-output-face ((t (:foreground ,alienblood-green))))
   `(slime-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alienblood-red)))
      (t
       (:underline ,alienblood-red))))
   `(slime-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alienblood-orange)))
      (t
       (:underline ,alienblood-orange))))
   `(slime-style-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alienblood-yellow)))
      (t
       (:underline ,alienblood-yellow))))
   `(slime-note-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alienblood-green)))
      (t
       (:underline ,alienblood-green))))
   `(slime-highlight-face ((t (:inherit highlight))))
;;;;; speedbar
   `(speedbar-button-face ((t (:foreground ,alienblood-green+2))))
   `(speedbar-directory-face ((t (:foreground ,alienblood-cyan))))
   `(speedbar-file-face ((t (:foreground ,alienblood-fg))))
   `(speedbar-highlight-face ((t (:foreground ,alienblood-bg :background ,alienblood-green+2))))
   `(speedbar-selected-face ((t (:foreground ,alienblood-red))))
   `(speedbar-separator-face ((t (:foreground ,alienblood-bg :background ,alienblood-blue-1))))
   `(speedbar-tag-face ((t (:foreground ,alienblood-yellow))))
;;;;; sx
   `(sx-custom-button
     ((t (:background ,alienblood-fg :foreground ,alienblood-bg-1
          :box (:line-width 3 :style released-button) :height 0.9))))
   `(sx-question-list-answers
     ((t (:foreground ,alienblood-green+3
          :height 1.0 :inherit sx-question-list-parent))))
   `(sx-question-mode-accepted
     ((t (:foreground ,alienblood-green+3
          :height 1.3 :inherit sx-question-mode-title))))
   '(sx-question-mode-content-face ((t (:inherit highlight))))
   `(sx-question-mode-kbd-tag
     ((t (:box (:color ,alienblood-bg-1 :line-width 3 :style released-button)
          :height 0.9 :weight semi-bold))))
;;;;; tabbar
   `(tabbar-button ((t (:foreground ,alienblood-fg
                                    :background ,alienblood-bg))))
   `(tabbar-selected ((t (:foreground ,alienblood-fg
                                      :background ,alienblood-bg
                                      :box (:line-width -1 :style pressed-button)))))
   `(tabbar-unselected ((t (:foreground ,alienblood-fg
                                        :background ,alienblood-bg+1
                                        :box (:line-width -1 :style released-button)))))
;;;;; term
   `(term-color-black ((t (:foreground ,alienblood-bg
                                       :background ,alienblood-bg-1))))
   `(term-color-red ((t (:foreground ,alienblood-red-2
                                     :background ,alienblood-red-4))))
   `(term-color-green ((t (:foreground ,alienblood-green
                                       :background ,alienblood-green+2))))
   `(term-color-yellow ((t (:foreground ,alienblood-orange
                                        :background ,alienblood-yellow))))
   `(term-color-blue ((t (:foreground ,alienblood-blue-1
                                      :background ,alienblood-blue-4))))
   `(term-color-magenta ((t (:foreground ,alienblood-magenta
                                         :background ,alienblood-red))))
   `(term-color-cyan ((t (:foreground ,alienblood-cyan
                                      :background ,alienblood-blue))))
   `(term-color-white ((t (:foreground ,alienblood-fg
                                       :background ,alienblood-fg-1))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))
;;;;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,alienblood-fg+1 :weight bold))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,alienblood-red-1 :weight bold))))
   `(undo-tree-visualizer-default-face ((t (:foreground ,alienblood-fg))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,alienblood-yellow))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,alienblood-cyan))))
;;;;; visual-regexp
   `(vr/group-0 ((t (:foreground ,alienblood-bg :background ,alienblood-green :weight bold))))
   `(vr/group-1 ((t (:foreground ,alienblood-bg :background ,alienblood-orange :weight bold))))
   `(vr/group-2 ((t (:foreground ,alienblood-bg :background ,alienblood-blue :weight bold))))
   `(vr/match-0 ((t (:inherit isearch))))
   `(vr/match-1 ((t (:foreground ,alienblood-yellow-2 :background ,alienblood-bg-1 :weight bold))))
   `(vr/match-separator-face ((t (:foreground ,alienblood-red :weight bold))))
;;;;; volatile-highlights
   `(vhl/default-face ((t (:background ,alienblood-bg-05))))
;;;;; web-mode
   `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face ((t (:foreground ,alienblood-orange ))))
   `(web-mode-css-prop-face ((t (:foreground ,alienblood-orange))))
   `(web-mode-css-pseudo-class-face ((t (:foreground ,alienblood-green+3 :weight bold))))
   `(web-mode-css-rule-face ((t (:foreground ,alienblood-blue))))
   `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face ((t (:underline t))))
   `(web-mode-function-name-face ((t (:foreground ,alienblood-blue))))
   `(web-mode-html-attr-name-face ((t (:foreground ,alienblood-orange))))
   `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face ((t (:foreground ,alienblood-cyan))))
   `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face ((t (:background ,alienblood-bg))))
   `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face ((t (:background ,alienblood-red))))
;;;;; whitespace-mode
   `(whitespace-space ((t (:background ,alienblood-bg+1 :foreground ,alienblood-bg+1))))
   `(whitespace-hspace ((t (:background ,alienblood-bg+1 :foreground ,alienblood-bg+1))))
   `(whitespace-tab ((t (:background ,alienblood-red-1))))
   `(whitespace-newline ((t (:foreground ,alienblood-bg+1))))
   `(whitespace-trailing ((t (:background ,alienblood-red))))
   `(whitespace-line ((t (:background ,alienblood-bg :foreground ,alienblood-magenta))))
   `(whitespace-space-before-tab ((t (:background ,alienblood-orange :foreground ,alienblood-orange))))
   `(whitespace-indentation ((t (:background ,alienblood-yellow :foreground ,alienblood-red))))
   `(whitespace-empty ((t (:background ,alienblood-yellow))))
   `(whitespace-space-after-tab ((t (:background ,alienblood-yellow :foreground ,alienblood-red))))
;;;;; wanderlust
   `(wl-highlight-folder-few-face ((t (:foreground ,alienblood-red-2))))
   `(wl-highlight-folder-many-face ((t (:foreground ,alienblood-red-1))))
   `(wl-highlight-folder-path-face ((t (:foreground ,alienblood-orange))))
   `(wl-highlight-folder-unread-face ((t (:foreground ,alienblood-blue))))
   `(wl-highlight-folder-zero-face ((t (:foreground ,alienblood-fg))))
   `(wl-highlight-folder-unknown-face ((t (:foreground ,alienblood-blue))))
   `(wl-highlight-message-citation-header ((t (:foreground ,alienblood-red-1))))
   `(wl-highlight-message-cited-text-1 ((t (:foreground ,alienblood-red))))
   `(wl-highlight-message-cited-text-2 ((t (:foreground ,alienblood-green+2))))
   `(wl-highlight-message-cited-text-3 ((t (:foreground ,alienblood-blue))))
   `(wl-highlight-message-cited-text-4 ((t (:foreground ,alienblood-blue+1))))
   `(wl-highlight-message-header-contents-face ((t (:foreground ,alienblood-green))))
   `(wl-highlight-message-headers-face ((t (:foreground ,alienblood-red+1))))
   `(wl-highlight-message-important-header-contents ((t (:foreground ,alienblood-green+2))))
   `(wl-highlight-message-header-contents ((t (:foreground ,alienblood-green+1))))
   `(wl-highlight-message-important-header-contents2 ((t (:foreground ,alienblood-green+2))))
   `(wl-highlight-message-signature ((t (:foreground ,alienblood-green))))
   `(wl-highlight-message-unimportant-header-contents ((t (:foreground ,alienblood-fg))))
   `(wl-highlight-summary-answered-face ((t (:foreground ,alienblood-blue))))
   `(wl-highlight-summary-disposed-face ((t (:foreground ,alienblood-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((t (:foreground ,alienblood-blue))))
   `(wl-highlight-summary-normal-face ((t (:foreground ,alienblood-fg))))
   `(wl-highlight-summary-thread-top-face ((t (:foreground ,alienblood-yellow))))
   `(wl-highlight-thread-indent-face ((t (:foreground ,alienblood-magenta))))
   `(wl-highlight-summary-refiled-face ((t (:foreground ,alienblood-fg))))
   `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))
;;;;; which-func-mode
   `(which-func ((t (:foreground ,alienblood-green+4))))
;;;;; xcscope
   `(cscope-file-face ((t (:foreground ,alienblood-yellow :weight bold))))
   `(cscope-function-face ((t (:foreground ,alienblood-cyan :weight bold))))
   `(cscope-line-number-face ((t (:foreground ,alienblood-red :weight bold))))
   `(cscope-mouse-face ((t (:foreground ,alienblood-bg :background ,alienblood-blue+1))))
   `(cscope-separator-face ((t (:foreground ,alienblood-red :weight bold
                                            :underline t :overline t))))
;;;;; yascroll
   `(yascroll:thumb-text-area ((t (:background ,alienblood-bg-1))))
   `(yascroll:thumb-fringe ((t (:background ,alienblood-bg-1 :foreground ,alienblood-bg-1))))
   ))

;;; Theme Variables
(alienblood-with-color-variables
  (custom-theme-set-variables
   'alienblood
;;;;; ansi-color
   `(ansi-color-names-vector [,alienblood-bg ,alienblood-red ,alienblood-green ,alienblood-yellow
                                          ,alienblood-blue ,alienblood-magenta ,alienblood-cyan ,alienblood-fg])
;;;;; company-quickhelp
   `(company-quickhelp-color-background ,alienblood-bg+1)
   `(company-quickhelp-color-foreground ,alienblood-fg)
;;;;; fill-column-indicator
   `(fci-rule-color ,alienblood-bg-05)
;;;;; nrepl-client
   `(nrepl-message-colors
     '(,alienblood-red ,alienblood-orange ,alienblood-yellow ,alienblood-green ,alienblood-green+4
                    ,alienblood-cyan ,alienblood-blue+1 ,alienblood-magenta))
;;;;; pdf-tools
   `(pdf-view-midnight-colors '(,alienblood-fg . ,alienblood-bg-05))
;;;;; vc-annotate
   `(vc-annotate-color-map
     '(( 20. . ,alienblood-red-1)
       ( 40. . ,alienblood-red)
       ( 60. . ,alienblood-orange)
       ( 80. . ,alienblood-yellow-2)
       (100. . ,alienblood-yellow-1)
       (120. . ,alienblood-yellow)
       (140. . ,alienblood-green-1)
       (160. . ,alienblood-green)
       (180. . ,alienblood-green+1)
       (200. . ,alienblood-green+2)
       (220. . ,alienblood-green+3)
       (240. . ,alienblood-green+4)
       (260. . ,alienblood-cyan)
       (280. . ,alienblood-blue-2)
       (300. . ,alienblood-blue-1)
       (320. . ,alienblood-blue)
       (340. . ,alienblood-blue+1)
       (360. . ,alienblood-magenta)))
   `(vc-annotate-very-old-color ,alienblood-magenta)
   `(vc-annotate-background ,alienblood-bg-1)
   ))

;;; Rainbow Support

(declare-function rainbow-mode 'rainbow-mode)
(declare-function rainbow-colorize-by-assoc 'rainbow-mode)

(defvar alienblood-add-font-lock-keywords nil
  "Whether to add font-lock keywords for alienblood color names.
In buffers visiting library `alienblood-theme.el' the alienblood
specific keywords are always added.  In all other Emacs-Lisp
buffers this variable controls whether this should be done.
This requires library `rainbow-mode'.")

(defvar alienblood-colors-font-lock-keywords nil)

;; (defadvice rainbow-turn-on (after alienblood activate)
;;   "Maybe also add font-lock keywords for alienblood colors."
;;   (when (and (derived-mode-p 'emacs-lisp-mode)
;;              (or alienblood-add-font-lock-keywords
;;                  (equal (file-name-nondirectory (buffer-file-name))
;;                         "alienblood-theme.el")))
;;     (unless alienblood-colors-font-lock-keywords
;;       (setq alienblood-colors-font-lock-keywords
;;             `((,(regexp-opt (mapcar 'car alienblood-colors-alist) 'words)
;;                (0 (rainbow-colorize-by-assoc alienblood-colors-alist))))))
;;     (font-lock-add-keywords nil alienblood-colors-font-lock-keywords)))

;; (defadvice rainbow-turn-off (after alienblood activate)
;;   "Also remove font-lock keywords for alienblood colors."
;;   (font-lock-remove-keywords nil alienblood-colors-font-lock-keywords))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'alienblood)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; alienblood-theme.el ends here
