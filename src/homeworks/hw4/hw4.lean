/-
CS 2120 F22 Homework #4. Due Oct 13.
-/

/- #1A [10 points]

Write a formal proposition stating that 
logical and (∧) is associative. That is, 
for arbitrary propositions, P, Q, and R,
P ∧ (Q ∧ R) is true *iff* (P ∧ Q) ∧ R is, 
too. Replace the placeholder (_) with your
answer.
-/

def and_associative : Prop := 
  ∀ (P Q R : Prop), P ∧ (Q ∧ R) ↔ (P ∧ Q) ∧ R

 
/- #1B [10 points]

Give an English language proof. Identify
the inference rules of predicate logic
that you use in your reasoning.
-/

/-
Answer: 
Assume that P, Q, and R are arbitrary but specific proposiitons. 
Using the rule iff introduction, we can split the desired proof  
into two cases that if both satisfied, will prove P ∧ (Q ∧ R) ↔ (P ∧ Q) ∧ R.

For the first case, P ∧ (Q ∧ R) → (P ∧ Q) ∧ R , we can use arrow introduction to assume the 
premise (P ∧ (Q ∧ R)). Using and elimination (left and right) we can obtain proofs of P and (Q ∧ R). We can
apply and elimination again to the proof of Q ∧ R to obtain proofs of Q and R. Having obtained proofs 
for P, Q, and R, we can use and-introduction to obtain a proof of (P ∧ Q). Finally, we can obtain a proof of the conclusion
by applying and-intro to (P ∧ Q) and R, obtaining  (P ∧ Q) ∧ R.

For the second case, (P ∧ Q) ∧ R → P ∧ (Q ∧ R), we can use arrow introduction to assume the 
premise (P ∧ Q) ∧ R. Using and elimination (left and right), we can obtain proofs of R and (P ∧ Q). We can apply and-elimination
again (left and right) to obtain proofs of P and Q. Given that we have proofs of P, Q, and R we can construct a proof 
of the conclusion using and introduction to create (Q ∧ R) and then P ∧ (Q ∧ R).#check

Hence we have proven ∀ (P Q R : Prop), P ∧ (Q ∧ R) ↔ (P ∧ Q) ∧ R.
-/

/- #1C [5 points]

Give a formal proof of the proposition.
Hint: unfold and_associative to start.
-/

theorem and_assoc_true : and_associative :=
begin
intros P Q R,
apply iff.intro,

assume left,
cases left with p q_r,
cases q_r with q r,
let p_q := and.intro p q, --let sets it as a variable (stores the proof of p and q in p_q)
let p_q_r := and.intro p_q r,
exact p_q_r, --like return

assume right,
cases right with p_q r,
cases p_q with p q,
let q_r := and.intro q r,
let p_q_r := and.intro p q_r,
exact p_q_r,
end
/- #2A [10 points]

Write the proposition that ∨ is associative.,
analogous to the proposition about ∧ in #1.
-/

def or_associative : Prop := 
  ∀ (P Q R: Prop), P ∨ (Q ∨ R) ↔ (P ∨ Q) ∨ R



/- #2B [10 points]

Write an English language proof of it, citing
the specific inference rules you use in your
reasoning.

Answer:
Assume that P, Q, and R are arbitrary but specific proposiitons. 
Using the rule iff introduction, we can split the desired proof  
into two cases that if both satisfied, will prove P ∨ (Q ∨ R) ↔ (P ∨ Q) ∨ R.

For the first case, ∀ (P Q R: Prop), P ∨ (Q ∨ R) → (P ∨ Q) ∨ R, we can use arrow 
introduction to assume the premise P ∨ (Q ∨ R). We can apply case analysis on or-elimination
to create two sub-goals that if both proven to be true will let us obtain a proof of the conclusion (P ∨ Q) ∨ R.
For the first case, when we have a proof of P, we can apply or-introduction left to obtain a proof 
of (P ∨ Q). We can apply or-introduction left again to obtain a proof of the conclusion, (P ∨ Q) ∨ R.
For our second case, when we a have a proof of (Q ∨ R), we can break it into two subgoals, one for when we 
have a proof of Q and one for when we have a proof of R, by using case analysis with or-elimination on (Q ∨ R). 
Using or-introduction twice, we can use our proofs of Q and R in our seperate cases to obtain a proof of the conclusion, 
(P ∨ Q) ∨ R.

For the sake of the grader's sanity and my own, I will cut some edges on the wording for this part of the proof
since it is essentially the same logic as the first case. 
For the second case, ∀ (P Q R: Prop), (P ∨ Q) ∨ R → P ∨ (Q ∨ R), we can use arrow 
introduction to assume the premise P ∨ (Q ∨ R). Using or-elimination several times we can obtain 
seperate proofs for P, Q, and R in their respective cases, where for each case at least one proof of P, Q, or R must exist.
For each one of these cases, we can apply or-introduction several times to obtain a proof of the conlclusion P ∨ (Q ∨ R).

Hence we have proven ∀ (P Q R: Prop), P ∨ (Q ∨ R) ↔ (P ∨ Q) ∨ R.

-/


/- #2C [5 points]

Complete the following formal proof.
-/

theorem or_associative_true : or_associative :=
begin
intros P Q R,
apply iff.intro,

--left side of iff
assume left,
cases left with p q_r,
--proof for p
apply or.intro_left R (or.intro_left Q p),
--proof for q or r
cases q_r with q r,
--proof for q
apply or.intro_left R (or.intro_right P q),
--proof for r
exact or.inr r,

--right side of iff
assume right,
cases right with p_q r,
--proof for p or q
cases p_q with p q,
--proof for p
apply or.inl p,
--proof for q
apply or.inr (or.inl q),
--proof for r
apply or.inr (or.inr r),

end


/- #3A [10 points]
Write a formal statement of the proposition.
-/

def arrow_transitive : Prop :=
  ∀ (X Y Z: Prop), (X → Y) → (Y → Z) → (X → Z)

/- #3B [10 points]

Write an English language proof of the proposition
that for any propositions, X, Y, and X, it's the
case that (X → Y) → (Y → Z) → (X → Z). In other
words, implication is "transitive." Hint: Recall
that if you have a proof of, say, X → Y, and you 
have a proof of X, you can derive a proof of Y by
arrow elimination. Think of it as applying a proof
of an implication to a proof of its premise to get
yourself a proof of its conclusion.
Answer:
Assume that X, Y, and Z are arbitrary but specific proposiitons. Using arrow introduction we can obtain a proof of (X → Y).
Using arrow introduction again we can obtain a proof of (Y → Z). Using arrow introduction again we can obtain a proof of X. 
Given this proof of X, we can use arrow elimination to get a proof of Y by applying our proof of X to (X → Y). 
Given this proof of Y, we can use arrow elimination to get a proof of Z by applying our proof of Y to (Y → Z). By obtaining
a proof of Z we have proven the proposition  ∀ (X Y Z: Prop), (X → Y) → (Y → Z) → (X → Z).


-/


/- #3C [5 points]. 
Write a formal proof of it.
-/
theorem arrow_transitive_true : arrow_transitive :=
begin
intros X Y Z,
assume x_y,
assume y_z,
assume x,
let y : Y := x_y x,
let z : Z := y_z y,
exact z,
--other approach
--exact y_z (x_y x),
--apply y_z,
--apply x_y,
--exact x, --exact means i have exactly what matches the goal
end

/- #4
Suppose that if it's raining then the streets
are wet. This problem requires you to prove that
if the streets are not wet then it's not raining.
-/

/- #4A [10 points]

Start by writing the proposition in predicate
logic by completing the following answer.


-/


def contrapositive : Prop :=
  ∀ (Raining Wet : Prop), 
    (Raining → Wet) → (¬Wet → ¬Raining)


/- #4B [10 points]. 
-/

theorem contrapositive_valid : contrapositive :=
begin
unfold contrapositive,
intros R W,
assume left,
assume l1,
assume r,
let w : W := left r,
let f := l1 w,
exact f,

end

/- #4C [5 points]. 

Give an English language proof of it.
Answer:

Assume that Raining and Wet are arbitrary but specific proposiitons. Using arrow
introduction we can obtain a proof of the premise, (Raining → Wet). Applying arrow
introduction again we can obtain a proof of ¬Wet, which is equivilant to the proposition
Wet → False. Applying arrow introduction again we can obtain a proof of Raining. Using arrow elimination,
we can obtain a proof of wet by applying the proof of Raining to the proof of (Raining → Wet). Using arrow 
elimination again, we can obtain a proof of false by applying a proof of Wet to ¬Wet (which is equivilant to Wet → False). 
Finally, as we have constructed a proof of false we can apply false elimination to prove that ∀ (Raining Wet : Prop), 
    (Raining → Wet) → (¬Wet → ¬Raining) is true.
-/


/- #5. Extra credit.

Complete the following formal proof of the 
proposition that if for any proposition P, 
P ∨ ¬P is true, then for any propositions, 
X and Y, if it's not the case that X or Y
is true then it is the case that ¬X and ¬Y 
is true. 
-/

theorem demorgan1 : 
  (∀ (P : Prop), P ∨ ¬ P) → 
    ∀ (X Y : Prop), 
      ¬(X ∨ Y) → (¬X ∧ ¬Y) :=
begin
assume em X Y nxory,
cases (em X) with x nx,
let foo := or.intro_left Y x,
--case 1
let f := nxory foo,
exact false.elim f,

--case 2
cases em Y with y ny,

let xory := or.inr y,
let f2 := nxory xory,
apply false.elim f2,

exact and.intro nx ny,

end

/-
A comment on or.intro_left and or.intro_right.
In Lean each of these takes two arguments: a
proof of the disjunct -- the proposition on 
one side of the ∨ -- that is to be proven true, 
*and* it takes as an argument the proposition 
that is not being proven true. In applications 
of these rules the proposition argument (not 
being proven) comes first, while the proof 
argument comes second.

The reason is that Lean needs to know what 
overall proposition is being proved. From the
proof argument it can infer the proposition 
being proved, but it needs the other proposition
as well to know the full (X ∨ Y) disjunction to
be proved. 

Here's an example:
-/

example : 0 = 0 ∨ 0 = 1 :=
begin
apply or.intro_left (0 = 1) rfl
/-
The "rfl" serves as a proof of 0=0.
But in addition, as the first argument
to or.intro, we need to provide the
*proposition* that is not being proved.
Here's that's (0 = 1). In contexts
where Lean can infer both disuncts,
you can use the simpler or.inl or 
or.inr, each of which just takes one
argument: a proof of the left or of 
the right side, respectively.
-/
end

