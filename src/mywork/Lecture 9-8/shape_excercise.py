from z3 import *

triangle = Real('triangle')
square = Real('square')
circle = Real('circle')

s = Solver()
s.add(And(triangle + square + circle == 10,
          circle + square - triangle == 6,
          circle + triangle - square == 4))

if(s.check() == sat):
  print(s.model())
else:
  print("not satisfiable")