# Lisp 👽

[Lisp](<https://en.wikipedia.org/wiki/Lisp_(programming_language)>) (historically LISP; from _List Processing_) was a programming language created in 1958 by [John McCarthy](<https://en.wikipedia.org/wiki/John_McCarthy_(computer_scientist)>). Many dialects have been created over time, and today _Lisp_ is a generic name to refer to all these _cousin_ programming languages.

The most known Lisp dialects today (IMHO) are [Clojure](https://clojure.org/), [Common Lisp](https://common-lisp.net/), and [Scheme](<https://en.wikipedia.org/wiki/Scheme_(programming_language)>).

Lisp might be mostly known for its heavy usage of parens to enclose its S-expressions (parens-enclosed hierarchical structures used to represent complex data structures as well as program statements itself).

## Vocabulary and WTFs

```lisp
; FYI, comment lines in Lisp start with a semicolon
```

- **Atom:** unique, immutable values that can be either a datum (eg.: a number like `42`, a string like `"Hello!"`, etc.) or a symbol
  - **Number Atom:** a combination of digits that represent a quantity (Math)
  - **String Atom:** a double-quotes-enclosed combination of characters that represents text
  - **Symbol:** an atom that's used as identifier of a piece of data or operation/function. Symbols are analogous to variables in C-like languages
- **List:** a parens-enclosed, nestable group of atoms and other lists

```lisp
; Number Atoms are just numbers
43

; String Atoms are just text enclosed by double quotes
"Hello, World!"

; Symbols are a bit more complex, because they exist to represent something
; else. So, they must be bound to a value in order to be used.
adsf
name
(let [name "Joel Jucá"]
  (if (== true (not false))
    (print "All good!")))
```

```lisp
; Lists are always enclosed by parens
; Below is a four-items list of numbers 1 to 4
(1 2 3 4)

; Lists can contain other lists (nested lists)
; Below is a seven-items list with four number atoms and two lists,
; - Two number atoms as 1st and 2nd list items;
; - A two-items list, with numbers 3 and 4, as the 3rd item;
; - Two more number atoms as 4th and 5th items;
; - Another two-items list, with numbers 7 and 8, as the 6th item.
(1 2 (3 4) 5 6 (7 8))
```

- **S-expression:** short for _symbolic expression_; a syntax to represent either code and data. S-expressions can be either atoms or lists

<!-- - **List:** a parens-enclosed group of S-expressions
- a syntax for for denoting nested, tree-structured code and data. S-expressions are nestable lists made of atoms and/or other S-expressions -->

```lisp
; The most basic S-expressions is made by a single atom
1234 ; A single-atom S-expression


```

- **Cons cell:** a two-item tuple that's used to implement lists in Lisp. Items are historically named _CAR_ and _CDR_ (reads _coulder_), being CAR the one holding the actual value of the cons cell, and CDR holding a reference to the next item in the list (if it's `nil`, the list has reached its end).

  In Lisp, lists are [linked lists](https://en.wikipedia.org/wiki/Linked_list), and _cons cells_ are how its nodes are called.

### Lisp-related but not Lisp-specific

- **Datum:** an indivisible, single-piece of information. It's not a strict Lisp term, though it's frequently seem in many Lisp-related texts
- **Data:** a possibly more complex structure of information, possibly containing multiple datums (FYI, data is plural of datum)
