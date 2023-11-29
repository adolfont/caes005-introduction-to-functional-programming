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

def length_old (α : Type) (list : List α) : Nat :=
  match list with
  | List.nil => Nat.zero
  | List.cons head tail => Nat.succ (length_old α tail)

#eval length_old String  ["Sourdough", "bread","oiu"]
#eval length_old Int  [-10, -78, 176, 76]

#eval List.length [10, 8754, 34534]

def length {α : Type} (xs : List α) : Nat :=
  match xs with
  | [] => 0
  | y :: ys => Nat.succ (length ys)


#eval length ["Sourdough", "bread","oiu"]
#eval length  [-10, -78, 176, 76]


#eval ["Sourdough", "bread","oiu"].length
#eval List.length  ["Sourdough", "bread","oiu"]

#check List.length (α := Int)

def f := List.length (α := Int)

#eval f [12, 34, 5, 5, 6]

-- ERRO #eval f ["djshfdjs", "jjj"]


-- 28/November/2023

-- Option https://lean-lang.org/functional_programming_in_lean/getting-to-know/polymorphism.html#option

-- https://carbon.now.sh/?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=one-light&wt=none&l=auto&width=680&ds=true&dsyoff=20px&dsblur=68px&wc=true&wa=true&pv=56px&ph=56px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=%2523eval%2520List.head%253F%2520%255B1%255D%2520%2520%2520%2520%2520%2520%2520%2520--%2520some%25201%250A%2523eval%2520List.head%21%2520%255B1%255D%2520%2520%2520%2520%2520%2520%2520%2520--%25201%250A%250A%2523eval%2520List.headD%2520%255B1%255D%25203%2520%2520%2520%2520%2520%2520--%25201%250A%250A%2523eval%2520List.head%253F%2520%255B%255D%2520%2520%2520%2520%2520%2520%2520%2520%2520--%2520%2522don%27t%2520know%2520how%2520to%2520synthesize%2520implicit%2520argument%2522%250A%2523eval%2520List.head%21%2520%255B%255D%2520%2520%2520%2520%2520%2520%2520%2520%2520--%2520%2522typeclass%2520instance%2520problem%2520is%2520stuck%252C%2520it%2520is%2520often%2520due%2520to%2520metavariables%2522%250A%250A%2523eval%2520List.headD%2520%255B%255D%25203%2520%2520%2520%2520%2520%2520%2520--%25203%250A%250A%2523eval%2520List.head%253F%2520%255B%255D%2520%28%25CE%25B1%2520%253A%253D%2520Int%29%2520--%2520none%250A%2523eval%2520List.head%21%2520%255B%255D%2520%28%25CE%25B1%2520%253A%253D%2520Int%29%2520--%25200%250A%250A%2523eval%2520%255B%255D.head%253F%2520%28%25CE%25B1%2520%253A%253D%2520Int%29%2520%2520--%2520none%250A%250A%2523eval%2520%28%255B%255D%2520%253A%2520List%2520Int%29.head%253F%2520--%2520none%250A

#eval List.head? [1]        -- some 1
#eval List.head! [1]        -- 1

#eval List.headD [1] 3      -- 1

-- #eval List.head? []         -- "don't know how to synthesize implicit argument"
-- #eval List.head! []         -- "typeclass instance problem is stuck, it is often due to metavariables"

#eval List.headD [] 3       -- 3

#eval List.head? [] (α := Int) -- none
#eval List.head! [] (α := Int) -- 0

#eval [].head? (α := Int)  -- none

#eval ([] : List Int).head? -- none


def maybe (value : Option Int): Option Int :=
  value

#eval maybe (some 10)
#eval maybe none

-- Prod https://lean-lang.org/functional_programming_in_lean/getting-to-know/polymorphism.html#prod

-- "Many applications are best served by defining their own structures"
-- "there are some cases where it is not worth the overhead of defining a new type."

structure MyProd (α : Type) (β : Type) : Type where
  primo : α
  secondo : β
deriving Repr


def cinque : MyProd String Int := { primo := "five", secondo := 5 }

#eval cinque

def fives : String × Int := { fst := "five", snd := 5 }

#eval fives

def fives2 : String × Int := ("five", 5)

#eval fives2

def sevens : String × Int × Nat := ("VII", 7, 4 + 3)

def sevens2 : String × (Int × Nat) := ("VII", (7, 4 + 3))

#eval sevens2
#eval sevens2

-- Sum https://lean-lang.org/functional_programming_in_lean/getting-to-know/polymorphism.html#sum

-- DO NOT USE SUM

-- "Like Prod, Sum should be used either when writing very generic code, for a very small section of code where there is no sensible domain-specific type, or when the standard library contains useful functions. In most situations, it is more readable and maintainable to use a custom inductive type."

def PetName : Type := String ⊕ String

#check PetName

def animals : List PetName :=
  [Sum.inl "Spot", Sum.inr "Tiger", Sum.inl "Fifi", Sum.inl "Rex", Sum.inr "Floof"]

#eval animals

def howManyDogs (pets : List PetName) : Nat :=
  match pets with
  | [] => 0
  | Sum.inl _ :: morePets => howManyDogs morePets + 1
  | Sum.inr _ :: morePets => howManyDogs morePets

#eval howManyDogs animals

def NombreDePerroOEdad : Type := Sum String Int

#check NombreDePerroOEdad
def diverse : List NombreDePerroOEdad :=
  [Sum.inl "Spot", Sum.inr 18,
   Sum.inl "Fifi", Sum.inl "Rex", Sum.inr 45]

#eval diverse


-- Unit https://lean-lang.org/functional_programming_in_lean/getting-to-know/polymorphism.html#unit

def ex0: Unit := ()

#eval ex0

def x := Unit.unit

#eval x


inductive TestingUnit (aType : Type) : Type where
  | value : aType → TestingUnit aType
deriving Repr

#check TestingUnit Int
#check TestingUnit Unit

def ex1 : TestingUnit Int := (TestingUnit.value 10)

#eval ex1

def ex2 : TestingUnit Unit := (TestingUnit.value Unit.unit)

#eval ex2




-- Empty https://lean-lang.org/functional_programming_in_lean/getting-to-know/polymorphism.html#empty

def empty_one : Sum Empty String := Sum.inr "oi"

#check (empty_one)
-- #eval (empty_one) -- failed to be synthesized,

-- Naming: Sums, Products, and Units
-- https://lean-lang.org/functional_programming_in_lean/getting-to-know/polymorphism.html#naming-sums-products-and-units

-- "Generally speaking, types that offer multiple constructors are called sum types, while types whose single constructor takes multiple arguments are called product types"


-- Messages You May Meet

-- "Not all definable structures or inductive types can have the type Type. "


-- Exercises

-- https://lean-lang.org/functional_programming_in_lean/getting-to-know/polymorphism.html#exercises

-- Write a function to find the last entry in a list. It should return an Option.


def last {α  : Type} (xs : List α) : Option α :=
  match xs with
  | [] => none
  | ls :: []  => some ls
  | _ :: tail => last (tail)

#eval last [1,2,3]
#eval last [1,2]
#eval last [1]
#eval last (α := Int) []

-- See https://leanprover.zulipchat.com/#narrow/stream/113489-new-members/topic/Write.20a.20function.20to.20find.20the.20last.20entry.20in.20a.20list

def last2 {α : Type} (xs : List α) : Option α :=
  match xs with
  | [] => none
  | [ls] => some ls
  | _ :: tail => last tail

def last3 {α : Type} : List α → Option α
  | [] => none
  | [ls] => some ls
  | _ :: tail => last tail


#eval last3 ([] : List Int)
-- Write a function that finds the first entry in a list that satisfies a given predicate. Start the definition with def List.findFirst? {α : Type} (xs : List α) (predicate : α → Bool) : Option α :=
-- Write a function Prod.swap that swaps the two fields in a pair. Start the definition with def Prod.swap {α β : Type} (pair : α × β) : β × α :=
-- Rewrite the PetName example to use a custom datatype and compare it to the version that uses Sum.
-- Write a function zip that combines two lists into a list of pairs. The resulting list should be as long as the shortest input list. Start the definition with def zip {α β : Type} (xs : List α) (ys : List β) : List (α × β) :=.
-- Write a polymorphic function take that returns the first n
--  entries in a list, where n
--  is a Nat. If the list contains fewer than n entries, then the resulting list should be the input list. #eval take 3 ["bolete", "oyster"] should yield ["bolete", "oyster"], and #eval take 1 ["bolete", "oyster"] should yield ["bolete"].
-- Using the analogy between types and arithmetic, write a function that distributes products over sums. In other words, it should have type α × (β ⊕ γ) → (α × β) ⊕ (α × γ).
-- Using the analogy between types and arithmetic, write a function that turns multiplication by two into a sum. In other words, it should have type Bool × α → α ⊕ α.
