# basic

An implementation of an idealized version of the BASIC programming language. 
This is a project from the excellent book [Beautiful Racket](https://beautifulracket.com/basic). 

## Requirements

From [Beautiful Racket](https://beautifulracket.com/basic/specification.html):


> - `print` takes a string, number, or numer­ical expres­sion as input and displays it, followed by a newline. A list of print­able items can be sepa­rated by semi­colons `;` and the results will be concatenated. If `print` gets no input, it displays a blank line.
> - `goto` takes a number or numer­ical expres­sion as input, and imme­di­ately jumps to that line of the program.
> - `rem` starts a line comment. Anything between the rem and the next newline is ignored. Even if the rem is at the begin­ning, the line can still be the target of a goto.
> - `end` imme­di­ately aborts the program.

## Grammar

The grammar for this language, in Extended Backus–Naur form is as follows:

```
b-program : [b-line] (NEWLINE [b-line])*
b-line : b-line-num [b-statement] (":" [b-statement])* [b-rem]
b-line-num : INTEGER
b-statement : b-end | b-print | b-goto
b-rem : REM
b-end : "end"
b-print : "print" [b-printable] (";" [b-printable])*
b-printable : STRING | b-expr
b-goto : "goto" b-expr
b-expr : b-sum
b-sum : b-number ("+" b-number)*
b-number : INTEGER | DECIMAL
```

## Usage 

### Installing the package

- This requires [racket](https://download.racket-lang.org/)
- Clone this repository and `cd` into the `basic` directory
- Run `raco pkg install`

### Testing

Once the package is installed, the following programs can be run using `#lang basic`. 

#### [sample](tests/sample.rkt)

```
#lang basic
30 rem print 'ignored'
35
50 print "never gets here"
40 end
60 print 'three' : print 1.0 + 3
70 goto 11. + 18.5 + .5 rem ignored
10 print "o" ; "n" ; "e"
20 print : goto 60.0 : end
```
