;;; zimpl.el --- ZIMPL major mode

;; URL: https://github.com/ax487/zpl-mode.git
;; Version: 20180712
;; Package-Requires: ((emacs "24.3"))

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This package provides a major mode for
;; ZIMPL (Zuse Institute Mathematical Programming Language).
;; It supports basic font-lock highlights.

;;; Code:

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
(define-derived-mode zimpl-mode fundamental-mode "ZIMPL"
  "A major mode for editing ZIMPL files."
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

(add-to-list 'auto-mode-alist '("\\.zpl\\'" . zimpl-mode))

(provide 'zimpl)

;;; zimpl.el ends here
