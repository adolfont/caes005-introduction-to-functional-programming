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
