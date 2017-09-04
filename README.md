# Making `ledger-mode` more Evil

`evil-ledger` is a minor mode for Emacs that adds Evil motions and operators to
`ledger-mode` buffers. It allows you to treat transactions as text objects while
in `evil-mode` -- selecting, deleting, and changing around and inside them as a
unit.

For example, given the transaction and cursor (indicated by `|`) below

```
2000/01/01 * Landlord
    Expenses:Rent      |                     $500.00
    Assets::Chequing
```

`vax` selects the transaction around point and all whitespace up to the next
transaction. This makes for easy copying, moving, and deletion of transactions
as a whole, instead of by selecting a series of lines.

## Usage

`evil-ledger-mode` is a self-contained minor mode, so you can simply enable it
in a `ledger-mode` buffer to try it out, and disable it when you don't need it.

### Using Transactions as Text Objects

`evil-ledger-mode` adds `ix` and `ax` to the visual and operator states for
selecting inside and around transactions, respectively. This means you can, for
example

- Select the transaction at point with `vix`, and include surrounding whitespace
  with `vax`.
- Delete the current transaction with `dax`, or replace it with `cax`.

`evil-ledger-mode` supports repeated invocations, so for example `vaxax` selects
the transaction at point, plus the next one as well, and so on.

Commands also support numerical prefixes, so `d3ax` deletes the current and next
two transactions.

### Navigation

`evil-ledger-mode` also provides navigation aids `gj` and `gk` for jumping to
the next and previous transactions, respectively. Of course, `3gj` will work as
expected.

### Alignment and Sorting

`evil-ledger-mode` adds an `evil-ledger-align` operator to visual state with the
keybinding `=`, so that, for example, `v3ax=` will select the next three
transactions and align all postings in them.

There is also an `evil-ledger-sort` operator that will sort transactions by date
(as per `ledger-sort-region`), although it does not have a keybinding by
default. You can add one with

``` emacs-lisp
(evil-define-key* 'visual evil-ledger-mode-map
                  "S" #'evil-ledger-sort)
```

or by setting `evil-ledger-sort-key`.

### Configuration

To make the minor mode start automatically in Ledger buffers, you can add it as
a hook in your configuration, e.g.

``` emacs-lisp
(add-hook 'ledger-mode-hook #'evil-ledger-mode))
```

For `use-package` users, the following is a sample configuration:

``` emacs-lisp
(use-package evil-ledger
  :ensure t
  :after ledger-mode
  :config
  (setq evil-ledger-sort-key "S")
  (add-hook 'ledger-mode-hook #'evil-ledger-mode))
```

## License

All code is made available under the GPLv3, the same license as Emacs itself.
