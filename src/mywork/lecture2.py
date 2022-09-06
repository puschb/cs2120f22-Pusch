from z3 import *

x,y,z = Int('x y z')

s = Solver()

s.add(And(x > 0,y>0,z>0,x+y+z == 100, 15*x+ 1*y+.25*z ==100))
print(s.model)
