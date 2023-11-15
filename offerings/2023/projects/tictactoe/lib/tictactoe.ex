defmodule TicTacToe do
  @moduledoc """
  Documentation for `TicTacToe`.
  """

  defstruct symbols: [:x, :o], board: [:e, :e, :e, :e, :e, :e, :e, :e, :e]

  @doc """
  The symbols of tic-tac-toe are :x and :o

  ## Examples

      iex> TicTacToe.new()
      %TicTacToe{symbols: [:x, :o]}

  """

  # CRC pattern - constructor(s), reducer(s), converter(s)

  def new() do
    %__MODULE__{}
  end

  def play(game = %TicTacToe{board: _b}, symbol, _line, _column) do
    new_board = [symbol, :e, :e, :e, :e, :e, :e, :e, :e]

    # https://hexdocs.pm/elixir/1.15.7/List.html#replace_at/3

    %{game | board: new_board}
  end

end
