# Game Task

You will implement a game called ["TIC-TAC-TOE: 4 IN A ROW!"](https://emu.edu/gaming-hub/tic-tac-toe).


## Description

"TIC-TAC-TOE: 4 IN A ROW!" is a unique twist on the classic Tic-Tac-Toe game. In this version, players are challenged to achieve a victory by connecting four of their pieces in a row. The game provides an engaging and strategic experience, where players must carefully plan their moves to outsmart their opponent and form a winning combination.

One distinctive feature of this version is the limitation of only four pieces for each player. Once a player places their fifth piece on the board, the oldest piece will disappear. This introduces an additional layer of strategy, requiring players to not only focus on their current moves but also to consider the consequences of their earlier placements.

The objective remains the same – be the first to connect four pieces horizontally, vertically, or diagonally. With the dynamic element of disappearing pieces, players must think ahead and adapt their tactics throughout the game. This variation adds a fresh and exciting dimension to the traditional Tic-Tac-Toe, making it a compelling and fast-paced challenge for players of all ages.


## Instructions

Your project should be inside your private repo shared with me.

You will create a [Mix Task](https://elixirschool.com/en/lessons/intermediate/mix_tasks) so that the game can be played on a terminal. See my sample [tasks] project(https://github.com/adolfont/caes005-introduction-to-functional-programming/tree/main/offerings/2023/projects/tasks).

You do not have to implement the "computer plays". You can play like this:

```
$ mix play
What's Player 1 name?
Adolfo // you type
What's Player 2 name?
Gustavo // you type
OK, let's start the game!
The current board is:
_ _ _ _
_ _ _ _
_ _ _ _
_ _ _ _ 
Adolfo, choose an empty position between (1,1) and (4,4):
(1,2) // you type
The current board is:
_ X _ _
_ _ _ _
_ _ _ _
_ _ _ _ 
Gustavo, choose an empty position between (1,1) and (4,4):
(1,2) // you type
Gustavo, you should have chosen an empty position! Position (1,2) is not empty.
Gustavo, choose an empty position between (1,1) and (4,4):
(5,5) // you type
Gustavo, you should have chosen a position between (1,1) and (4,4)! Position (5,5) is out of bounds.
Gustavo, choose an empty position between (1,1) and (4,4):
(2,2) // you type
The current board is:
_ X _ _
_ O _ _
_ _ _ _
_ _ _ _ 
Adolfo, choose an empty position between (1,1) and (4,4):
(maria,joaquina) // you type
Adolfo, you should have chosen a position between (1,1) and (4,4)! Position (maria,joaquina) is not a valid position.
Adolfo, choose an empty position between (1,1) and (4,4):
(1,1) // you type
The current board is:
X X _ _
_ O _ _
_ _ _ _
_ _ _ _ 
```

and so on.

After Adolfo has played, in this order:
```
...
(3,1)
(1,1)
(1,2)
(1,3)
```

it is time for Adolfo to play again.

```
The current board is:
X X X _
_ O O _
X O O _
_ _ _ _ 
Adolfo, choose an empty position between (1,1) and (4,4):
(1,4) // you type
Congrats, Adolfo! You won!
// end of the game
```


