# basic

An implementation of an idealized version of the BASIC programming language. 
This is part of the excellent book [Beautiful Racket](https://beautifulracket.com/basic). 

## Requirements

From [Beautiful Racket](https://beautifulracket.com/basic/specification.html):


> - `print` takes a string, number, or numer­ical expres­sion as input and displays it, followed by a newline. A list of print­able items can be sepa­rated by semi­colons `;` and the results will be concatenated. If `print` gets no input, it displays a blank line.
> - `goto` takes a number or numer­ical expres­sion as input, and imme­di­ately jumps to that line of the program.
> - `rem` starts a line comment. Anything between the rem and the next newline is ignored. Even if the rem is at the begin­ning, the line can still be the target of a goto.
> - `end` imme­di­ately aborts the program.
