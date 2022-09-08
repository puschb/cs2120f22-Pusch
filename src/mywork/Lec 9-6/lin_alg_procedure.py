from z3 import *

x = Int('x')
y = Int('y')
z = Int('z')

s = Solver()
s.add(And(3*x + 2*y - z - 1 == 0,2*x + 2*y + 4*z +2 ==0,-x + .5*y - z == 0))
isSat = s.check()
if (isSat == sat) :
  print(s.model())
else:
  print("There are no solutions")