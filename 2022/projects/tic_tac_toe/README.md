# TicTacToe

- plays
- states
- board


Initial state:
_ _ _
_ _ _
_ _ _ 

position   line  column
1  1 1 
2  1 2
3  1 3
4  2 1
...
position = (line-1)*3+column
["_", "_", "_", "_","_", "_","_", "_","_"]

After player 1 puts an X on line 3, column 1
_ _ _
_ _ _
X _ _ 

After player 2 puts an O on line 2, column 2
_ _ _
_ O _
X _ _

After player 1 puts an X on line 2, column 2
INVALID

After player 1 puts an X on line 3, column 2
_ _ _
_ O _
X X _



- board
  - matrix containing 9 cells
    - as list
    - coordinates


Three types of functions:
- Constructor
- Reducers
- Transformers

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `tic_tac_toe` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tic_tac_toe, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/tic_tac_toe>.

