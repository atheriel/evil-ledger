;;; evil-ledger.el --- Make `ledger-mode' more `evil'. -*- lexical-binding: t -*-

;; Copyright (C) 2017 Aaron Jacobs

;; Author: Aaron Jacobs <atheriel@gmail.com>
;; URL: https://github.com/atheriel/evil-ledger
;; Keywords: evil, vim-emulation
;; Version: 0.1
;; Package-Requires: ((evil "1.0.0"))

;; This file is NOT part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; This package provides `evil-ledger-mode', which provides motions for
;; `ledger-mode' using Evil.

;;; Code:

(require 'evil)
(require 'ledger-mode)

(defgroup evil-ledger nil
  "Minor mode for more evil in `ledger-mode'."
  :group 'evil)

(evil-declare-motion #'ledger-navigate-next-xact-or-directive)
(evil-declare-motion #'ledger-navigate-prev-xact-or-directive)

(defvar evil-ledger-mode-map
  (let ((map (make-sparse-keymap)))
    (mapc (lambda (state)
            (evil-define-key state map
              "gj" #'ledger-navigate-next-xact-or-directive
              "gk" #'ledger-navigate-prev-xact-or-directive))
          '(normal motion))
   map))

(define-minor-mode evil-ledger-mode
  "Minor mode for more evil in `ledger-mode'."
  :lighter " EvilLedger"
  :keymap evil-ledger-mode-map
  :group 'evil-ledger
  (evil-normalize-keymaps))

(provide 'evil-ledger)

;; Local Variables:
;; coding: utf-8
;; End:

;;; evil-ledger.el ends here
