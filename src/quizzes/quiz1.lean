/-
CS2120 Fall 2022 Sullivan. Quiz #1. Edit your answers into
this file using VSCode. Save the file to your *local* hard 
drive (File > Save As > local > ...). Submit it to the Quiz1
assignment on Collab.
-/

/-
#1: For each of the following questions give a yes/no answer 
and then a very brief explanation why that answer is correct.
To explain why your answer is correct, name the specific rule
of inference that tells you it's correct, or explain that 
there is no such valid inference rule.
-/

/-
#1A

If a ball, b, is round *and* b is also red, is b red?

A: yes/no: yes

B: Why? by and elimination


#1B

If flowers make you happy and chocolates make you happy,
and I give you flowers *or* I give you chocolates, will
you be happy?

A: yes/no: yes

B: Why? we can use and elimination left and right to obtain that 
flowers, chocolates make you happy and then use or introduction (right or left) to show taht
chocolates or flowers make you happy


#1C: If giraffes are just zebras in disguise, then the 
moon is made of green cheese?

A. yes/: yes

B. Why? Since giraffes are not zebras in disguise, we can apply
false elimination to conclude taht the moon is made of green cheese


#1D. If x = y implies that 0 = 1, then is it true that
x ≠ y?

A. yes/no:  yes

B. Why?By the contrapositive we know that x=y must be false, as 0=1 is false, hence
x ≠ y



#1E. If every zebra has stripes and Zoe is a Zebra then
Zoe has stripes.

A. yes/no: yes

B. Why? If every zebra has stripes then we can use for-all elimination to 
conclude that zoe, a zebra, must have stripes


#1F. If Z could be *any* Zebra and Z has stripes, then 
*every* Zebra has stripes.

A. Yes/no: yes

B: Why? since z is an arbitrarily specific zebra, and z has strypes, then
by for-all introduction we know htat every zebra must have stripes.


#1G. If whenever the wind blows, the leaves move, and 
the leaves are moving, then the wind is blowing.

A. yes/no: no

B. Why? For this to be a correct proposition, the converse of the arrow elimination rule
must be true, however it is a fallacy and hence the statement is false.  


#1H: If Gina is nice *or* Gina is tall, and Gina is nice,
then Gina is not tall. (The "or" here is understood to be
the or of predicate logic.)

A. yes/no: no

B. Why? We can use case analysis here to show that gina could be either tall
or not tall, and the contex would still hold true, hence Gina is not tall is false.
-/



/- 
#2

Consider the following formula/proposition in propositional
logic: X ∨ ¬Y.

#2A: Is is satisfiable? If so, give a model (a binding of 
the variables to values that makes the expressions true).

X = True
Y = False
#2B: Is it valid? Explain your answer. 
For the proposition to be valid, all possible interpretations must evaluate 
to true, hence a counter example would prove the proposition to not be valid.
Counter example: X = False, Y = True.

-/


/-
#3: 

Express the following propositions in predicate logic, by
filling in the blank after the #check command.

If P and Q are arbitrary (any) propositions, then if (P is 
true if and only if Q is true) then if P is true then Q is 
true.
-/

#check ∀ (P Q : Prop), P ↔ Q → P → Q



/-
#4 Translate the following expressions into English.
The #check commands are just Lean commands and can
be ignored here. 
-/


-- A
#check ∀ (n m : ℕ), n < m → m - n > 0

/-
Answer: If n and m are any natural numbers, if n is less than m, than m-n is greater than 0.
-/

-- B

#check ∃ (n : ℕ), ∀ (m : nat), m >= n
/-
Answer: There exists a natural number n, such that for all natural numbers m, m is greater or equal to n
-/


-- C

variables (isEven: ℕ → Prop) (isOdd: ℕ → Prop)
#check ∀ (n : ℕ), isEven n ∨ isOdd n

/-
Answer: If n is any arbitrary natural number, then n is even or odd
-/


-- D

#check ∀ (P : Prop), P ∨ ¬P

/-
Answer: For all propositions P, P is either true or false
-/


-- E

#check ∀ (P : Prop), ¬(P ∧ ¬P)

/-
Answer: For all propositions P, P can't be both true and false
-/


/-
#5 Extra Credit

Next we define contagion as a proof of a slightly long
proposition. Everything before the comma introduces new
terms, which are then used after the comma to state the
main content of the proposition. 

Using the names we've given to the variables to infer
real-world meanings, state what the logic means in plain
natural English. Please don't just give a verbatim reading
of the formal logic. 
-/

variable contagion : 
  ∀ (Animal : Type) 
  (hasVirus : Animal → Prop) 
  (a1 a2 : Animal) 
  (hasVirus : Animal → Prop)
  (closeContact : Animal → Animal → Prop), 
  hasVirus a1 → closeContact a1 a2 → hasVirus a2

 -- if any arbitrarily specific animal a1 has a virus, then if that animal comes into close contact with
 --any other arbitrarily specific animal a2, then a2 will also have the virus


