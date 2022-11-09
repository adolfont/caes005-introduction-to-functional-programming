defmodule TicTacToe do
  @moduledoc """
  Documentation for `TicTacToe`.
  """

  @empty "_"

  @spec new_board :: [...]
  @doc """
  Creates an empty board.

  ## Examples

      iex> TicTacToe.new_board()
      ["_", "_", "_", "_", "_", "_", "_", "_", "_"]

  """
  def new_board() do
    List.duplicate(@empty, 9)
  end

  @spec play(list, 1 | 2, number, number) :: list
  def play(board, player, line, column)
      when line >= 1 and line <= 3 and column >= 1 and column <= 3 do
    if Enum.at(board, position(line, column)) == @empty do
      List.replace_at(board, position(line, column), player_symbol(player))
    end
  end

  defp position(line, column) do
    (line - 1) * 3 + (column - 1)
  end

  @spec empty_symbol :: <<_::8>>
  def empty_symbol(), do: @empty

  @spec player_symbol(1 | 2) :: <<_::8>>
  def player_symbol(1), do: "X"
  def player_symbol(2), do: "O"

  def finished?([s, _, _, s, _, _, s, _, _]), do: {s, true}
  def finished?([_, s, _, _, s, _, _, s, _]), do: {s, true}
  def finished?([_, _, s, _, _, s, _, _, s]), do: {s, true}
  def finished?([s, s, s, _, _, _, _, _, _]), do: {s, true}
  def finished?([_, _, _, s, s, s, _, _, _]), do: {s, true}
  def finished?([_, _, _, _, _, _, s, s, s]), do: {s, true}
  def finished?([s, _, _, _, s, _, _, _, s]), do: {s, true}
  def finished?([_, _, s, _, s, _, s, _, _]), do: {s, true}

  def finished?(list) do
    {nil, not Enum.any?(list, fn s -> s == @empty end)}
  end
end
