# TicTacToe

TicTacToe is a text-based implementation of the Tic-tac-toe game where the user plays against the computer that chooses its move using a pseudorandom number generator.

To run it, clone this repository and do the following:


```
$ git clone https://github.com/adolfont/caes005-introduction-to-functional-programming.git

Cloning into 'caes005-introduction-to-functional-programming'...
remote: Enumerating objects: 1150, done.
remote: Counting objects: 100% (515/515), done.
remote: Compressing objects: 100% (311/311), done.
remote: Total 1150 (delta 253), reused 366 (delta 155), pack-reused 635
Receiving objects: 100% (1150/1150), 313.28 KiB | 3.52 MiB/s, done.
Resolving deltas: 100% (590/590), done.

$ cd caes005-introduction-to-functional-programming/2022/projects/tic_tac_toe/

$ mix deps.get

Resolving Hex dependencies...
Resolution completed in 0.023s
Unchanged:
  earmark_parser 1.4.29
  ex_doc 0.29.1
  makeup 1.1.0
  makeup_elixir 0.16.0
  makeup_erlang 0.1.1
  nimble_parsec 1.2.3
* Getting ex_doc (Hex package)
* Getting earmark_parser (Hex package)
* Getting makeup_elixir (Hex package)
* Getting makeup_erlang (Hex package)
* Getting makeup (Hex package)
* Getting nimble_parsec (Hex package)

$ mix start

==> earmark_parser
Compiling 1 file (.yrl)
Compiling 2 files (.xrl)
Compiling 3 files (.erl)
Compiling 46 files (.ex)
Generated earmark_parser app
==> nimble_parsec
Compiling 4 files (.ex)
Generated nimble_parsec app
==> makeup
Compiling 44 files (.ex)
Generated makeup app
==> makeup_elixir
Compiling 6 files (.ex)
Generated makeup_elixir app
==> makeup_erlang
Compiling 3 files (.ex)
warning: Application.get_env/3 is discouraged in the module body, use Application.compile_env/3 instead
  lib/makeup/lexers/erlang_lexer.ex:250: Makeup.Lexers.ErlangLexer

Generated makeup_erlang app
==> ex_doc
Compiling 25 files (.ex)
Generated ex_doc app
==> tic_tac_toe
Compiling 3 files (.ex)
Generated tic_tac_toe app
== Tic-tac-toe Game ==
Do you want a random game? (yes/no)? 


```


## Example

```
$ mix start
== Tic-tac-toe Game ==
Do you want a random game? (yes/no)? yes
OK, random game chosen!
The first move is yours!
Current board
_ _ _
_ _ _
_ _ _

Type line and column of your move
(two numbers, line and column, between 1 and 3 separated by a blank space, or -1 to quit):  1 1
You chose line=1, column=1!
Current board
X _ O
_ _ _
_ _ _

Type line and column of your move
(two numbers, line and column, between 1 and 3 separated by a blank space, or -1 to quit):  2 2
You chose line=2, column=2!
Current board
X _ O
_ X _
_ O _

Type line and column of your move
(two numbers, line and column, between 1 and 3 separated by a blank space, or -1 to quit):  3 3
You chose line=3, column=3!
Current board
X _ O
_ X _
_ O X

Congrats! You won!
```


