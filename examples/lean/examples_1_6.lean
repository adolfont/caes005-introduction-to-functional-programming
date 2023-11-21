structure PPoint (α : Type) where
  x : α
  y : α
deriving Repr

def natOrigin : PPoint Nat :=
  { x := Nat.zero, y := Nat.zero }

#eval natOrigin

def anotherPoint : PPoint Nat :=
  { x := 15, y := 13 }

#eval anotherPoint

def stringPoint : PPoint String :=
 { x := "quinze", y := "treze" }

#eval stringPoint

def replaceX (α : Type) (point : PPoint α) (newX : α) : PPoint α :=
  { point with x := newX }

#check (replaceX)

#check replaceX Nat

#check replaceX Nat natOrigin

#check replaceX Nat natOrigin 5

#eval replaceX Nat natOrigin 5

#eval natOrigin

inductive Sign where
  | pos
  | neg

def posOrNegThree (s : Sign) : match s with | Sign.pos => Nat | Sign.neg => Int :=
  match s with
  | Sign.pos => (3 : Nat)
  | Sign.neg => (-3 : Int)

#eval posOrNegThree (Sign.pos)
#eval posOrNegThree (Sign.neg)

#check posOrNegThree (Sign.pos)

def primesUnder10 : List Nat := [2, 3, 5, 7]

#eval primesUnder10

def explicitPrimesUnder10 : List Nat :=
  List.cons 2 (List.cons 3 (List.cons 5 (List.cons 7 List.nil)))

#eval explicitPrimesUnder10

#eval (List.cons 7 List.nil)

#eval (List.cons 5 (List.cons 7 List.nil))

def length (α : Type) (list : List α) : Nat :=
  match list with
  | List.nil => Nat.zero
  | List.cons head tail => Nat.succ (length α tail)

#eval length String  ["Sourdough", "bread"]
#eval length Int  [-10, -78, 176, 76]

--#eval List.length [10, "bread"]
