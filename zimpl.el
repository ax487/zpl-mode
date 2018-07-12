 ;;; zimpl.el --- Zimpl major mode

;; Copyright (C) 2001  Free Software Foundation, Inc.

;; Author: StefanMonnier
;; Keywords: extensions

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

 ;;; Commentary:

;;

 ;;; Code:

;; (defvar zimpl-mode-map
;;   (let ((map (make-sparse-keymap)))
;;     (define-key map [foo] 'zimpl-do-foo)
;;     map)
;;   "Keymap for `zimpl-mode'.")

(defvar zimpl-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?# "<" st)
    (modify-syntax-entry ?\n ">" st)
    st)
  "Syntax table for `zimpl-mode'.")

(defvar zimpl-keywords '("set" "param" "var"
                         "defset" "defnumb" "defstrg" "defbool"
                         "minimize" "maximize"
                         "subto"
                         "include"
                         "and" "or" "xor" "not"
                         "if" "then" "else" "end"
                         "forall" "in" "do"
                         "without" "with"
                         "binary" "integer" "implicit binary" "real"
                         "scale" "separate" "checkonly" "indicator"
                         "read" "as" "skip" "use" "comment"))

(defvar zimpl-builtins '(
                          "union" "cross" "inter" "in" "symdiff" "proj"
                          "argmin" "argmax"
                          "print" "check"
                          "min" "max" "mod" "abs" "sgn" "floor" "ceil" "round"
                          "sum" "prod" "card" "random" "ord"
                          "sqrt" "log" "ln" "exp"
                          "substr" "lenth"
                          "powerset" "indexset" "subsets"))

;; (regexp-opt zimpl-keywords)
;; (regexp-opt zimpl-constants)

(defvar zimpl-constants '("infinity"))

;; (defvar zimpl-font-lock-keywords
;;   `(,(regexp-opt zimpl-keywords) . font-lock-constant-face)
;;   "Keyword highlighting specification for `zimpl-mode'.")

(defvar zimpl-font-lock-keywords
  (list `(,(regexp-opt zimpl-keywords 'words) . font-lock-keyword-face)
        `(,(regexp-opt zimpl-constants 'words) . font-lock-constant-face)
        `(,(regexp-opt zimpl-builtins 'words) . font-lock-builtin-face))
  "Keyword highlighting specification for `zimpl-mode'.")

;; (defvar zimpl-imenu-generic-expression
;;   ...)

;; (defvar zimpl-outline-regexp
;;   ...)

 ;;;###autoload
(define-derived-mode zimpl-mode fundamental-mode "Zimpl"
  "A major mode for editing Zimpl files."
  :syntax-table zimpl-mode-syntax-table
  (setq-local comment-start "# ")
  (setq-local comment-start-skip "#+\\s-*")
  (setq-local font-lock-defaults
              '(zimpl-font-lock-keywords))
                                        ;(setq-local indent-line-function 'zimpl-indent-line)
                                        ;(setq-local imenu-generic-expression
                                        ;            zimpl-imenu-generic-expression)
                                        ;(setq-local outline-regexp zimpl-outline-regexp)
  )

 ;;; Indentation

;; (defun zimpl-indent-line ()
;;   "Indent current line of Zimpl code."
;;   (interactive)
;;   (let ((savep (> (current-column) (current-indentation)))
;;      (indent (condition-case nil (max (zimpl-calculate-indentation) 0)
;;                (error 0))))
;;     (if savep
;;      (save-excursion (indent-line-to indent))
;;       (indent-line-to indent))))

;; (defun zimpl-calculate-indentation ()
;;   "Return the column to which the current line should be indented."
;;   ...)

(add-to-list 'auto-mode-alist '("\\.zpl\\'" . zimpl-mode))

(provide 'zimpl)
 ;;; zimpl.el ends here
