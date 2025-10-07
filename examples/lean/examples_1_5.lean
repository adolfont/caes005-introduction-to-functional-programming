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


-- **Toggle InfoView**

def isZero (n : Nat) : Bool :=
  match n with
  | Nat.zero => true
  | Nat.succ _k => false


#eval isZero Nat.zero
#eval isZero 5
#check isZero
#check isZero 5


def pred (n : Nat) : Nat :=
  match n with
  | Nat.zero => Nat.zero
  | Nat.succ k => k

#check pred
#eval pred 5
#eval Nat.pred 5


structure Point3D where
  x : Float
  y : Float
  z : Float
-- deriving Repr
-- deriving Repr automatically generates a default way to print or display values of Point3D.

#eval Point3D.mk 1.0 2.0 3.0

structure Client where
  name: String
  age: Nat
  salary: Float

def antonio := Client.mk "Antonio" 28 19899.97

#eval antonio
#eval antonio.name

-- "In this case, it would have been much simpler to just use the z accessor, but structure patterns are occasionally the simplest way to write a function."
def depth (p : Point3D) : Float :=
  match p with
  | { x:= _h, y := _w, z := d } => d

-- Recursive Functions
-- https://lean-lang.org/functional_programming_in_lean/getting-to-know/datatypes-and-patterns.html#recursive-functio

#eval "Definitions that refer to the name being defined are called recursive definitions."

-- Recursive datatypes are nicely complemented by recursive functions.

#eval Nat.zero
#eval Nat.succ Nat.zero
#eval Nat.succ (Nat.succ Nat.zero)
#eval Nat.succ (Nat.succ (Nat.succ Nat.zero))
#eval 3 == Nat.succ (Nat.succ (Nat.succ Nat.zero))


#eval "structural recursion"
def even (n : Nat) : Bool :=
  match n with
  | Nat.zero => true
  | Nat.succ k => not (even k)

/-
If we pattern match
Nat.succ (Nat.succ Nat.zero)
and
Nat.succ k
what is the value that is going to be assigned to k???


k == Nat.succ Nat.zero
n == Nat.succ (Nat.succ Nat.zero)

-/

#eval "Unlike many languages, Lean ensures by default
that every recursive function will eventually reach
a base case. "

-- error
/-
def evenLoops (n : Nat) : Bool :=
   match n with
   | Nat.zero => true
   | Nat.succ k => not (evenLoops n)
-/

def plus (n : Nat) (k : Nat) : Nat :=
  match k with
  | Nat.zero => n
  | Nat.succ k' => Nat.succ (plus n k')

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



-- Anonymous Functions

#eval (fun x => x + 1) 5  -- returns 6
-- #eval (fun x => x + 1)
#check (fun x => x + 1)

#eval (fun x y => x * y) 3 4  -- returns 12
#check (fun x y => 2* x * y)
-- partial application with an anonymous function
#check (fun x y => 2* x * y) 3

def addOne := fun x => x + 1
#eval addOne 10  -- returns 11

-- \lambda is λ
-- \mapsto is ↦

#eval (λ x ↦ x + 1) 7  -- returns 8
#check (λ x ↦ x + 1)

-- λxy is λ(x,y) ?

-- Anonymous functions with Point3D objects

#eval (λ x y z => Point3D.mk x y z) 1.0 2.0 3.0
-- Output: Point3D.mk 1.0 2.0 3.0


def p1 := Point3D.mk 1.0 2.0 3.0
def p2 := Point3D.mk 4.0 5.0 6.0

#eval (fun a b => Point3D.mk (a.x + b.x) (a.y + b.y) (a.z + b.z)) p1 p2
-- Output: Point3D.mk 5.0 7.0 9.0

#eval (fun p factor => Point3D.mk (p.x * factor) (p.y * factor) (p.z * factor)) p1 2.0
-- Output: Point3D.mk 2.0 4.0 6.0

-- Function that receives another function as argument

-- Function that receives another function `f` and a point `p`
def applyToPoint (f : Float → Float) (p : Point3D) : Point3D :=
  Point3D.mk (f p.x) (f p.y) (f p.z)

-- Example usage: double all coordinates
def p := Point3D.mk 1.0 2.0 3.0
#eval applyToPoint (fun x => x * 2) p
-- Output: Point3D.mk 2.0 4.0 6.0


-- Function that returns another function

def makeScaler (factor : Float) : Point3D → Point3D :=
  fun p => Point3D.mk (p.x * factor) (p.y * factor) (p.z * factor)

-- Example usage
-- def p := Point3D.mk 1.0 2.0 3.0

def doublePoint := makeScaler 2.0
#eval doublePoint p
-- Output: Point3D.mk 2.0 4.0 6.0

def triplePoint := makeScaler 3.0
#eval triplePoint p
-- Output: Point3D.mk 3.0 6.0 9.0

#eval 2^3

#eval (λ x y ↦ x^y) 2 40

def age := 25

#eval (λ x ↦ x+age) 10
