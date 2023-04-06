# basic

An implementation of an idealized version of the BASIC programming language. 
This is a project from the excellent book [Beautiful Racket](https://beautifulracket.com/basic). 

## Features 

### Basic Methods

#### [sample](tests/sample.rkt)

- `print`
- `goto`
-  `rem` 
- `end`

### Variables, Expressions, & Conditionals

- [variables](tests/variables.rkt)
- [expressions](tests/expressions.rkt)
- [conditionals](tests/conditionals.rkt)

### Functions, Import, Export, REPL, & Command Line Arguments 

- [functions](tests/functions.rkt)
- [import](tests/sample-importer.rkt)
- [export](tests/sample-exporter.rkt)
- [repl](tests/repl-test.rkt)
- [args](tests/report-args.rkt)

## Grammar

The grammar for this language, in Extended Backus–Naur form is as follows:

```racket
#lang brag
b-program : [b-line] (/NEWLINE [b-line])*
b-line : b-line-num [b-statement] (/":" [b-statement])* [b-rem]
@b-line-num : INTEGER
b-rem : REM
@b-statement : b-end | b-print | b-goto
             | b-let | b-input | b-if
             | b-gosub | b-return | b-for | b-next
             | b-def | b-import | b-export
b-end : /"end"
b-print : /"print" [b-printable] (/";" [b-printable])*
@b-printable : STRING | b-expr
b-goto : /"goto" b-expr
b-let : [/"let"] b-id /"=" (STRING | b-expr)
b-if : /"if" b-expr /"then" (b-statement | b-expr)
                   [/"else" (b-statement | b-expr)]
b-input : /"input" b-id
@b-id : ID
b-gosub : /"gosub" b-expr
b-return : /"return"
b-for : /"for" b-id /"=" b-expr /"to" b-expr [/"step" b-expr]
b-next : /"next" b-id
b-def : /"def" b-id /"(" b-id [/"," b-id]* /")" /"=" b-expr
b-import : /"import" b-import-name
@b-import-name : RACKET-ID | STRING
b-export : /"export" b-export-name
@b-export-name : ID
b-expr : b-or-expr
b-or-expr : [b-or-expr "or"] b-and-expr
b-and-expr : [b-and-expr "and"] b-not-expr
b-not-expr : ["not"] b-comp-expr
b-comp-expr : [b-comp-expr ("="|"<"|">"|"<>")] b-sum
b-sum : [b-sum ("+"|"-")] b-product
b-product : [b-product ("*"|"/"|"mod")] b-neg
b-neg : ["-"] b-expt
b-expt : [b-expt ("^")] b-value
@b-value : b-number | b-id | /"(" b-expr /")" | b-func
b-func : ID /"(" b-expr [/"," b-expr]* /")"
@b-number : INTEGER | DECIMAL
b-repl : (b-statement | b-expr) (/":" [@b-repl])*
```

## Usage 

### Installing the package

- This requires [racket](https://download.racket-lang.org/)
- Clone this repository and `cd` into the `basic` directory
- Run `raco pkg install`

