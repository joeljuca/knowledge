# Lisp 👽

[Lisp](<https://en.wikipedia.org/wiki/Lisp_(programming_language)>) (historically LISP; from _List Processing_) was a programming language created in 1958 by [John McCarthy](<https://en.wikipedia.org/wiki/John_McCarthy_(computer_scientist)>). Many dialects have been created over time, and today _Lisp_ is a generic name to refer to all these _cousin_ programming languages.

The most known Lisp dialects today (IMHO) are [Clojure](https://clojure.org/), [Common Lisp](https://common-lisp.net/), and [Scheme](<https://en.wikipedia.org/wiki/Scheme_(programming_language)>).

Lisp might be mostly known for its heavy usage of parenthesis to enclose its S-expressions (parenthesis-enclosed hierarchical structures used to represent complex data structures as well as program statements itself).

## Vocabulary and WTFs

- **datum:** a single piece of data (eg.: a string, a number, etc; it's not a strict Lisp term, though it's frequently seem in many Lisp-related texts)
- **atom:** unique immutable values – either a number or a symbol, that can also be used both as variable names or as data itself
- **symbol:** is a name that's associated to a value or a function. In Lisp, a symbol is what a variable is in C-like languages
- **S-expression:** is a syntax for for denoting nested, tree-structured code and data. S-expressions are nestable lists made of atoms and/or other S-expressions (aka.: _symbolic expression_, _sexpr_, or _sexp_; see: [S-expression](https://en.wikipedia.org/wiki/S-expression))
- **cons cell:** a two-item tuple that's used to implement lists in Lisp. Items are historically named _CAR_ and _CDR_ (reads _coulder_), being CAR the one holding the actual value of the const cell, and CDR holding a reference to the next item in the list (when CDR is _nil_ the list has reached its end; it's indeed a [linked list](https://en.wikipedia.org/wiki/Linked_list), and cons cells are how they call its nodes)

## Syntax and data types

```lisp
; Comment lines start with a semicolon
```

```lisp
; A list of numbers
(1 2 3 4 5)
```

Lisp syntax comprises of two things: atoms and S-expressions.

```lisp
; Comment lines start with a semicolon
```

```lisp
; Atoms
```

```lisp
; Symbols
```

```lisp
; S-expressions

; S-expressions are wrapped in parenthesis-delimited. They are nestable - which means an
; S-expression can be made of additional, inner S-expressions.

; An S-expression that adds two numbers would look like that:
(+ 1 2) ; => 3
```
