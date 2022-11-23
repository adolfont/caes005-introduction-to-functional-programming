defmodule TicTacToe do
  @moduledoc """
  Documentation for `TicTacToe`.
  """

  @empty "_"

  @spec new_board :: list
  @doc """
  Creates an empty board.

  ## Examples

      iex> TicTacToe.new_board()
      ["_", "_", "_", "_", "_", "_", "_", "_", "_"]

  """
  def new_board() do
    List.duplicate(@empty, 9)
  end

  @doc """
  Registers a play (consisting of player, line and column) on a board. 

  ## Examples

      iex> TicTacToe.play(["_", "_", "_", "_", "_", "_", "_", "_", "_"], 1, 1, 1)
      ["X", "_", "_", "_", "_", "_", "_", "_", "_"]

      iex> TicTacToe.play(["_", "_", "_", "_", "_", "_", "_", "_", "_"], 2, 1, 1)
      ["O", "_", "_", "_", "_", "_", "_", "_", "_"]

      iex> TicTacToe.play(["X", "_", "_", "_", "_", "_", "_", "_", "_"], 2, 2, 2)
      ["X", "_", "_", "_", "O", "_", "_", "_", "_"]

      iex> TicTacToe.play(["X", "_", "_", "_", "O", "_", "_", "_", "_"], 1, 3, 1)
      ["X", "_", "_", "_", "O", "_", "X", "_", "_"]
  """
  @spec play(list, 1..2, 1..3, 1..3) :: list
  def play(board, player, line, column)
      when line >= 1 and line <= 3 and column >= 1 and column <= 3 do
    if Enum.at(board, position(line, column)) == @empty do
      List.replace_at(board, position(line, column), player_symbol(player))
    end
  end

  @doc """
  Returns true when a position is empty. Otherwise, it returns false. 

  ## Examples

      iex> TicTacToe.allowed_play?(["_", "_", "_", "_", "_", "_", "_", "_", "_"], 1, 1)
      true

      iex> TicTacToe.allowed_play?(["_", "_", "_", "_", "_", "X", "_", "_", "_"], 2, 3)
      false

  """
  @spec allowed_play?(list, 1..3, 1..3) :: boolean()
  def allowed_play?(board, line, column) do
    Enum.at(board, position(line, column)) == @empty
  end

  defp position(line, column) do
    (line - 1) * 3 + (column - 1)
  end

  @spec empty_symbol :: String.t()
  def empty_symbol(), do: @empty

  @spec player_symbol(1..2) :: String.t()
  def player_symbol(1), do: "X"
  def player_symbol(2), do: "O"

  @doc """
  Returns true when the board is in a state where the game is finished.

  ## Examples

      iex> TicTacToe.finished?(["X", "_", "_", "X", "_", "_", "X", "_", "_"])
      {"X", true}

      iex> TicTacToe.finished?(["O", "_", "_", "_", "O", "_", "_", "_", "O"])
      {"O", true}

  """
  @spec finished?(list) :: {String.t() | nil, boolean()}
  def finished?([s, _, _, s, _, _, s, _, _]) when s != @empty, do: {s, true}
  def finished?([_, s, _, _, s, _, _, s, _]) when s != @empty, do: {s, true}
  def finished?([_, _, s, _, _, s, _, _, s]) when s != @empty, do: {s, true}
  def finished?([s, s, s, _, _, _, _, _, _]) when s != @empty, do: {s, true}
  def finished?([_, _, _, s, s, s, _, _, _]) when s != @empty, do: {s, true}
  def finished?([_, _, _, _, _, _, s, s, s]) when s != @empty, do: {s, true}
  def finished?([s, _, _, _, s, _, _, _, s]) when s != @empty, do: {s, true}
  def finished?([_, _, s, _, s, _, s, _, _]) when s != @empty, do: {s, true}

  def finished?(list) do
    {nil, not Enum.any?(list, fn s -> s == @empty end)}
  end
end
