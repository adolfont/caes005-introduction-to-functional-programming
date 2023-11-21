defmodule TicTacToeTest do
  use ExUnit.Case
  doctest TicTacToe

  test "Put an x on position 1,1" do
    game = TicTacToe.new()

    assert TicTacToe.play(game, :x, 1, 1) ==
        %TicTacToe{board: [:x, :e, :e,
                           :e, :e, :e,
                           :e, :e, :e]}
  end
  test "Put an o on position 1,1" do
    game = TicTacToe.new()

    assert TicTacToe.play(game, :o, 1, 1) ==
        %TicTacToe{board: [:o, :e, :e,
                           :e, :e, :e,
                           :e, :e, :e]}
  end
  test "Put an x on position 2,2" do
    game = TicTacToe.new()

    assert TicTacToe.play(game, :x, 2, 2) ==
        %TicTacToe{board: [:e, :e, :e,
                           :e, :x, :e,
                           :e, :e, :e]}
  end
end
