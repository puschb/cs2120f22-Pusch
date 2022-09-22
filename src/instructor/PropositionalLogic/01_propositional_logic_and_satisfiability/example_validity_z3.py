from z3 import *


def isValid(P):
    s = Solver()
<<<<<<< HEAD
    s.add(Not(P)) # replace True with required declarative spec
    return (s.check()==unsat)
=======
    s.add(Not(P))  # replace True with required declarative spec
    return (s.check() == unsat)

>>>>>>> f3cd51248d20db3db414c22cefcc486a1550f53c

# Declare X to be a Z3 Bool variable
X = Bool('X')
# Print the result of testing (X Or Not X) for validity
print(isValid(Or(X, Not(X))))
# Print the result of testing (X And Not X) for validity
print(isValid(And(X, Not(X))))
