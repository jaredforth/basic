#lang basic
10 x = 2 : y = 3 : z = 5
20 print f(3, 4)
30 print f(f(3, g(2)), 2)
40 def f(x, y) = x * y * z
50 def g(i) = i + i
60 print y