defmodule TicTacToeTest do
  use ExUnit.Case
  doctest TicTacToe

  test "Create an empty board" do
    assert TicTacToe.new_board() == List.duplicate(TicTacToe.empty_symbol(), 9)
  end

  test "Player 1 puts an X on line 3, column 1" do
    board_after_play =
      TicTacToe.new_board()
      |> TicTacToe.play(1, 3, 1)

    assert board_after_play == ["_", "_", "_", "_", "_", "_", "X", "_", "_"]
  end

  test "Player 1 puts an X on line 1, column 1" do
    board_after_play =
      TicTacToe.new_board()
      |> TicTacToe.play(1, 1, 1)

    assert board_after_play == ["X", "_", "_", "_", "_", "_", "_", "_", "_"]
  end

  test "Player can be only 1 or 2" do
    assert_raise FunctionClauseError,
                 "no function clause matching in TicTacToe.player_symbol/1",
                 fn ->
                   TicTacToe.new_board()
                   |> TicTacToe.play(3, 1, 1)
                 end
  end

  test "Player 1 puts an X on line 1, column 1 and then" <>
         "Player 2 puts an O on line 1, column 2" do
    board_after_play =
      TicTacToe.new_board()
      |> TicTacToe.play(1, 1, 1)
      |> TicTacToe.play(2, 1, 2)

    assert board_after_play == ["X", "O", "_", "_", "_", "_", "_", "_", "_"]
  end

  test "Plays: 1 1 1, 2 1 2, 1 2 1, 2 2 2, 1 3 1" do
    board_after_play =
      TicTacToe.new_board()
      |> TicTacToe.play(1, 1, 1)
      |> TicTacToe.play(2, 1, 2)
      |> TicTacToe.play(1, 2, 1)
      |> TicTacToe.play(2, 2, 2)
      |> TicTacToe.play(1, 3, 1)

    assert board_after_play == [
             "X",
             "O",
             "_",
             "X",
             "O",
             "_",
             "X",
             "_",
             "_"
           ]

    assert TicTacToe.finished?(board_after_play) == {"X", true}
  end

  test "XXX
        O_O
        _O_ is a finished board" do
    assert TicTacToe.finished?([
             "X",
             "X",
             "X",
             "O",
             "_",
             "O",
             "X",
             "O",
             "_"
           ]) == {"X", true}
  end

  test "X_XOXO_OX is a finished board" do
    assert TicTacToe.finished?([
             "X",
             "_",
             "X",
             "O",
             "X",
             "O",
             "_",
             "O",
             "X"
           ]) == {"X", true}
  end

  test "XOX
        XOO
        OXX
   is a finished board" do
    assert TicTacToe.finished?([
             "X",
             "O",
             "X",
             "X",
             "O",
             "O",
             "O",
             "X",
             "X"
           ]) == {nil, true}
  end

  test "XOX
        XOO
        OX_
   is a finished board" do
    assert TicTacToe.finished?([
             "X",
             "O",
             "X",
             "X",
             "O",
             "O",
             "O",
             "X",
             "_"
           ]) == {nil, false}
  end
end
