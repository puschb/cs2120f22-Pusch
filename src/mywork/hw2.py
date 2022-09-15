from z3 import *

def check_prop(prop_name, proposition): 
  
  s = Solver()
  s.add(Not(proposition))
  
  check = s.check()
  if (check == unsat):
    print(f"{prop_name} is valid")
  else:
    print(f"{prop_name} is not valid, here is a counter example: {s.model()}")
  
x,y,z = Bools('X Y Z')

#1. X ∨ Y, X ⊢ ¬Y             -- affirming the disjunct
C1 = Implies(And(Or(x,y),x),Not(y))
# If both X ∨ Y and X are true, then Y must be false
check_prop("C1",C1)
#Lets say x true when it is sunny and y is true when it is cold. The proposition
#is saying that it is either sunny or cold or both and that it is currently sunny.
#This does not mean that it is not currently cold, as both sunny and cold can be true 
#with this statement staying logical.

#2. X, Y ⊢ X ∧ Y              -- and introduction
C2 = Implies(And(x,y),And(x,y))
#If If X and Y are true, then X ∧ Y is true
check_prop("C2",C2)

#3. X ∧ Y ⊢ X                 -- and elimination left
C3 = Implies(And(x,y),x)
#If X ∧ Y is true, then x is true
check_prop("C3",C3)

#4. X ∧ Y ⊢ Y                 -- and elimination right
C4 = Implies(And(x,y),y)
#If X ∧ Y is true, then y is true
check_prop("C4",C4)

#5. ¬¬X ⊢ X                   -- negation elimination 
C5 = Implies(Not(Not(x)),x)
#If the double negation of X is true, then X must be true
check_prop("C5",C5)

#6. ¬(X ∧ ¬X)                 -- no contradiction\
C6 = Not(And(x,Not(x)))
#It is always the case that x and not x is false, hence ¬(X ∧ ¬X) is always true
check_prop("C6",C6) 

#7. X ⊢ X ∨ Y                 -- or introduction left
C7 = Implies(x, Or(x,y))
#If x is true then X ∨ Y must be true
check_prop("C7",C7)

#8. Y ⊢ X ∨ Y                 -- or introduction right
C8 = Implies(y,Or(x,y))
#if Y is true, then X ∨ Y must be true
check_prop("C8",C8)

#9. X → Y, ¬X ⊢ ¬ Y           -- denying the antecedent
C9 = Implies(And(Implies(x,y),Not(x)),Not(y))
# If whenever X is true Y is true and X is X is false, then Y must also be false
#Lets say x is true when it is raining and y is true whenever it is cloudy. The proposition is saying
#that whenever it is raining it is cloudy and that it is currently not raining and that this entails that it is not cloudy. 
# However no rain does not mean no clouds, as it is obviously possible to have a cloudy sky without rain
check_prop("C9",C9)


#10. X → Y, Y → X ⊢ X ↔ Y      -- iff introduction
C10 = Implies(And(Implies(x,y),Implies(y,x)),x==y)
#If whenever X is true Y is true and whenever Y is true X is true, then X is equivilant to Y, that is that X is true if and only if Y is true.
check_prop("C10",C10)

#11. X ↔ Y ⊢ X → Y            -- iff elimination left
C11 = Implies(x==y, Implies(x,y))
#If X is equivilant to Y, that is X is true if and only if Y is true, then whenever X is true Y is true
check_prop("C11",C11)

#12. X ↔ Y ⊢ Y → X            -- iff elimination right
C12 = Implies(x==y, Implies(y,x))
#If X is equivilant to Y, that is X is true if and only if Y is true, then whenever Y is true X is true
check_prop("C12",C12)

#13. X ∨ Y, X → Z, Y → Z ⊢ Z  -- or elimination
C13 = Implies(And(Or(x,y),Implies(x,z),Implies(y,z)),z)
#If X ∨ Y is true, Z is true wheneer X is true, and Z is true whenever Y is true, then Z must be true
check_prop("C13",C13)

#14. X → Y, Y ⊢ X             -- affirming the conclusion
C14 = Implies(And(Implies(x,y),y),x)
#If whenever X is true Y is true and Y is currently true, then X must also be true
#Lets say x is true when a shape is a square and y is true when a shape is a rectangle. The proposition is saying
#that whenever you have a square it is also a rectangle and that the shape you currently have is a rectangle and that this
# entails that the shape you mave must be a square. However not every rectangle is a square so obviously this statement doesn't make sense.
check_prop("C14",C14)


#15. X → Y, X ⊢ Y             -- arrow elimination
C15 = Implies(And(Implies(x,y),x),y)
#If whenever X is true Y is true and X is true, then Y must also be true
check_prop("C15",C15)

#16. X → Y, Y → Z ⊢ X → Z     -- transitivity of → 
C16 = Implies(And(Implies(x,y),Implies(y,z)),Implies(x,z))
#If whenever X is true Y is true and whenever Y is true Z is true, then whenever X is true Z must also be true
check_prop("C16",C16)

#17. X → Y ⊢ Y → X            -- converse
C17 = Implies(Implies(x,y),Implies(y,x))
#If whenever X is true Y is true, then whenever Y is true X must also be true
#Lets say x is true when a shape is a square and y is true when a shape is a rectangle. The proposition is saying
#that whenever you have a square it is also a rectangle and that this entails that every rectangle is a square, which obviously isn't true
#because a rectangle with two sets of equal length sides is not a square.

check_prop("C17",C17)

#18. X → Y ⊢ ¬Y → ¬X          -- contrapositive
C18 = Implies(Implies(x,y),Implies(Not(y),Not(x)))
#if whenever X is true Y is true, then whenever Y is false X must also be false 

check_prop("C18",C18)

#19. ¬(X ∨ Y) ↔ ¬X ∧ ¬Y       -- DeMorgan #1 (¬ distributes over ∨)
C19 = Not(Or(x,y)) == And(Not(x),Not(y))
#¬(X ∨ Y) and ¬X ∧ ¬Y are equivilant, that is  ¬(X ∨ Y) is true if and only if ¬X ∧ ¬Y is true
check_prop("C19",C19)

#20. ¬(X ∧ Y) ↔ ¬X ∨ ¬Y       -- Demorgan #2 (¬ distributes over ∧)
C20 = Not(And(x,y)) == Or(Not(x),Not(y))
#¬(X ∧ Y) and ¬X ∨ ¬Y are equivilant, that is ¬(X ∧ Y) is true if and only if ¬X ∨ ¬Y
check_prop("C20",C20)