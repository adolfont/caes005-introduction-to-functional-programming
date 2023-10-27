-- Learn more about lean at:
-- https://lean-lang.org/
-- Functional Programming in Lean, by David Thrane Christiansen https://lean-lang.org/functional_programming_in_lean/
-- You can use Lean in your browser at https://live.lean-lang.org/

-- Language version:
-- Lean (version 4.0.0-nightly-2023-03-10, commit 0477276f66b0, Release)

-- VS Code plugin version:
-- lean4  v0.0.113
-- Lean 4 language support for VS Code

-- 1.5 Datatypes and Patterns
-- https://lean-lang.org/functional_programming_in_lean/getting-to-know/datatypes-and-patterns.html

-- "Lean constructors correspond to objects in JavaScript or TypeScript that include a tag that identifies the contents."

-- Pattern Matching

def isZero (n : Nat) : Bool :=
  match n with
  | Nat.zero => true
  | Nat.succ k => false


#eval isZero Nat.zero
#eval isZero 5

def pred (n : Nat) : Nat :=
  match n with
  | Nat.zero => Nat.zero
  | Nat.succ k => k

#eval pred 5


structure Point3D where
  x : Float
  y : Float
  z : Float
deriving Repr

-- "In this case, it would have been much simpler to just use the z accessor, but structure patterns are occasionally the simplest way to write a function."
def depth (p : Point3D) : Float :=
  match p with
  | { x:= h, y := w, z := d } => d

-- Recursive Functions
-- https://lean-lang.org/functional_programming_in_lean/getting-to-know/datatypes-and-patterns.html#recursive-functio

#eval "Definitions that refer to the name being defined are called recursive definitions."

-- Recursive datatypes are nicely complemented by recursive functions.

#eval "structural recursion"
def even (n : Nat) : Bool :=
  match n with
  | Nat.zero => true
  | Nat.succ k => not (even k)

#eval "Unlike many languages, Lean ensures by default that every recursive function will eventually reach a base case. "

-- error
-- def evenLoops (n : Nat) : Bool :=
--   match n with
--   | Nat.zero => true
--   | Nat.succ k => not (evenLoops n)

def plus (n : Nat) (k : Nat) : Nat :=
  match k with
  | Nat.zero => n
  | Nat.succ k'

  => Nat.succ (plus n k')

def times (n : Nat) (k : Nat) : Nat :=
  match k with
  | Nat.zero => Nat.zero
  | Nat.succ k' => plus n (times n k')

def minus (n : Nat) (k : Nat) : Nat :=
  match k with
  | Nat.zero => n
  | Nat.succ k' => pred (minus n k')

#eval plus 3 2

#eval times 3 5

#eval minus 10 5

#eval "Not every function can be easily written using structural recursion. "


-- def div (n : Nat) (k : Nat) : Nat :=
--  if n < k then
--    0
--  else Nat.succ (div (n - k) k)

-- "it is not structurally recursive,
-- because it doesn't follow the pattern of
-- finding a result for zero and transforming
-- a result for a smaller Nat into a result for its successor."
-- "In particular, the recursive invocation of the function
-- is applied to the result of another function call, rather
-- than to an input constructor's argument."

def factorial (n : Nat)  : Nat :=
  match n with
  | Nat.zero => 1
  | Nat.succ k => n * (factorial k)

#eval factorial 10

-- 1.6 Polymorphism https://lean-lang.org/functional_programming_in_lean/getting-to-know/polymorphism.html
