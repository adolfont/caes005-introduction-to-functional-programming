-- Learn more about lean at:
-- https://lean-lang.org/
-- Functional Programming in Lean, by David Thrane Christiansen https://lean-lang.org/functional_programming_in_lean/
-- You can use Lean in your browser at https://live.lean-lang.org/

-- Language version:
-- Lean (version 4.0.0-nightly-2023-03-10, commit 0477276f66b0, Release)

-- VS Code plugin version:
-- lean4  v0.0.113 
-- Lean 4 language support for VS Code

#eval 1 + 2 * 5

#eval String.append "Hello, " "Lean!"

#eval String.append "great " (String.append "oak " "tree")

#eval String.append "it is " (if 1 > 2 then "yes" else "no")

#eval 42 + 19
#eval String.append "A" (String.append "B" "C")
#eval String.append (String.append "A" "B") "C"
#eval if 3 == 3 then 5 else 7
#eval if 3 == 4 then "equal" else "not equal"

-- Types

#eval (1 + 2 : Nat)
#eval 1 - 2
#eval (1 - 2 : Int)
#check (1 - 2 : Int)

-- wring expression below
#check String.append "hello" [" ", "world"]


-- 1.3 Functions and Definitions

def hello := "Hello"

#check (hello)

def lean : String := "Lean"

#eval String.append hello (String.append " " lean)

-- Defining Functions

def add1 (n : Nat) : Nat := n + 1

#eval add1 7


def maximum (n : Nat) (k : Nat) : Nat :=
  if n < k then
    k
  else n

#eval maximum 2 3
#check maximum 2


-- Defining Types

def Str : Type := String

def aStr : Str := "This is a string."

def NaturalNumber : Type := Nat

def thirtyEight : NaturalNumber := (38 : Nat)

abbrev N : Type := Nat

def thirtyNine : N := 39

-- "Behind the scenes, some definitions are internally marked as being unfoldable during overload resolution, while others are not. Definitions that are to be unfolded are called reducible. Control over reducibility is essential to allow Lean to scale: fully unfolding all definitions can result in very large types that are slow for a machine to process and difficult for users to understand. Definitions produced with abbrev are marked as reducible."

-- 1.4 Structures

#check 1.2

#check -454.2123215

#check 0.0

#check 0

#check (0 : Float)


structure WrongPoint where
  x : Float
  y : Float

def wrong_origin : WrongPoint := { x := 0.0, y := 0.0 }

-- error
-- #eval wrong_origin

structure Point where
  x : Float
  y : Float
deriving Repr

def origin : Point := { x := 1.0, y := 2.0 }

#eval origin
#eval origin.x
#eval origin.y


def addPoints (p1 : Point) (p2 : Point) : Point :=
  { x := p1.x + p2.x, y := p1.y + p2.y }

def distance (p1 : Point) (p2 : Point) : Float :=
  Float.sqrt (((p2.x - p1.x) ^ 2.0) + ((p2.y - p1.y) ^ 2.0))


#eval addPoints { x := 1.0, y := 2.0 } { x := 5.0, y := -1.0 }

#eval distance { x := 1.0, y := 2.0 } { x := 5.0, y := -1.0 }

structure Point3D where
  x : Float
  y : Float
  z : Float
deriving Repr

def origin3D : Point3D := { x := 0.0, y := 0.0, z := 0.0 }


-- error
-- #check { x := 0.0, y := 0.0 }

#check ({ x := 0.0, y := 0.0 } : Point)


-- Updating Structures

-- not good:
-- def zeroX (p : Point) : Point :=
--  { x := 0, y := p.y }

-- good
def zeroX (p : Point) : Point :=
  { p with x := 0 }

def fourAndThree : Point :=
  { x := 4.3, y := 3.4 }

#eval fourAndThree

#eval zeroX fourAndThree

#eval fourAndThree

-- Behind the Scenes

#check Point.mk 1.5 2.8
#check (Point.mk)

structure NewPoint where
  new ::
  x : Float
  y : Float
deriving Repr

#check (NewPoint.x)
#check (NewPoint.y)

#eval NewPoint.new 1 2

#eval "one string".append " and another"

def Point.modifyBoth (f : Float → Float) (p : Point) : Point :=
  { x := f p.x, y := f p.y }

#eval fourAndThree

#eval fourAndThree.modifyBoth Float.floor

-- Exercises (https://lean-lang.org/functional_programming_in_lean/getting-to-know/structures.html#exercises)


structure RectangularPrism where
  new ::
  height : Float
  width : Float 
  depth : Float
deriving Repr

def RectangularPrism.volume (p: RectangularPrism) : Float := 
  p.height * p.width * p.depth 

def a_volume : RectangularPrism := RectangularPrism.new 1 20 3

#eval RectangularPrism.volume a_volume


structure Segment where
  new ::
  endpoint1 : Point
  endpoint2 : Point
deriving Repr

def Segment.length (p1: Point) (p2: Point) : Float := 
  Float.sqrt ((Float.pow (p2.x-p1.x) 2) + (Float.pow (p2.y-p1.y) 2))


def p1 : Point := { x := 2.0, y := -3.0 }
def p2 : Point := { x := -1.0, y := -2.0 }

-- should be ~3.16 https://byjus.com/maths/line-segment/#:~:text=A%20line%20segment%20has%20two%20definite%20endpoints%20in%20a%20line,units%20like%20feet%20or%20inches.
#eval Segment.length p1 p2

-- Which names are introduced by the declaration of RectangularPrism?
--  height, width and  depth

-- Which names are introduced by the following declarations of Hamster and Book? 
-- name and fluffy
--  title, author and price

-- What are their types?
-- String, Bool
-- String, String, Float


