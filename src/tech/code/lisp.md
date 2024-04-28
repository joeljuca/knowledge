# Lisp 👽

[Lisp](<https://en.wikipedia.org/wiki/Lisp_(programming_language)>) (historically LISP; from _List Processing_) was a programming language created in 1958 by [John McCarthy](<https://en.wikipedia.org/wiki/John_McCarthy_(computer_scientist)>). Many dialects have been created over time, and today _Lisp_ is a generic name to refer to all these _cousin_ programming languages.

The most known Lisp dialects today (IIUC) are [Clojure](https://clojure.org/), [Common Lisp](https://common-lisp.net/), and [Scheme](<https://en.wikipedia.org/wiki/Scheme_(programming_language)>).

Lisp might be mostly known for its heavy usage of parenthesis to enclose its S-expressions (parenthesis-enclosed hierarchical structures used to represent complex data structures as well as program statements itself).

## Vocabulary and WTFs

- **Datum**  
  a single piece of data (eg.: a string, a number, etc; it's not a strict Lisp term, though it's frequently seem in many Lisp-related texts)
- **Atom**  
  any data structure that is not a cons cell. Essentially, atoms are the fundamental building blocks that do not contain other LISP objects (numbers, symbols, strings, characters, keywords, and booleans are all atoms). The concept of atoms is useful for distinguishing between compound data structures (like lists) and simpler elements. For example, in an expression, you might want to check if a value is a simple element (atom) or a list
- **Symbol**  
  a basic data type that represents an identifier or a name. It's a fundamental building block in LISP, used to refer to various entities such as variables, functions, or special keywords
- **S-expression**  
  is a syntax for for denoting nested, tree-structured code and data. S-expressions are nestable lists made of atoms and/or other S-expressions (aka.: _symbolic expression_, _sexpr_, or _sexp_; see: [S-expression](https://en.wikipedia.org/wiki/S-expression))
- **Cons cell**  
  a two-item tuple that's used to implement lists in Lisp. Items are historically named _CAR_ and _CDR_ (reads _coulder_), being CAR the one holding the actual value of the const cell, and CDR holding a reference to the next item in the list (when CDR is _nil_ the list has reached its end; it's indeed a [linked list](https://en.wikipedia.org/wiki/Linked_list), and cons cells are how they call its nodes)

## Syntax and data types

How it works in practice.

### Comments

They start with a semicolon:

```lisp
; This is a comment
```

<!--
```lisp
; A list of numbers
(1 2 3 4 5)
```
-->

There are conventions for the number of semicolons to use:

1. semicolon when right-aligned with code
1. semicolons when block-aligned with code
1. semicolons when top-level

### Atoms

<!-- Lisp syntax comprises of two things: atoms and S-expressions. -->

```lisp
; A number atom
123
```

```lisp
; A string atom
"Hello there"
```

### Symbols

```lisp
; Define a symbol `name` with value `"Joel"`

(setq name "Joel") ; => "Joel"

name ; => "Joel"

; Here, the symbol `name` is being used with quote - so, a quoted symbol
'name ; => NAME
```

### S-expressions

An S-expression for a list of numbers:

```lisp
(1 2 3 4 5)
```

An S-expression for a sum operation:

```lisp
(+ 1 2) ; => 3
```

S-expressions can nest:

```lisp
(+ 1 (+ 2 (+ 3 4))) ; => 10
```
