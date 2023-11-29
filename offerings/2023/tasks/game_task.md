# Game Task

You will implement a game called ["TIC-TAC-TOE: 4 IN A ROW!"](https://emu.edu/gaming-hub/tic-tac-toe).

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
