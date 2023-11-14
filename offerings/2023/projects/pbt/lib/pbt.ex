defmodule Pbt do
  @moduledoc """
  Documentation for `Pbt`.
  """

  # @doc """
  # Hello world.

  # ## Examples

  #     iex> Pbt.hello()
  #     :world

  # """
  def hello(start, ending) do
    hd(Enum.shuffle(start..ending))
  end
end
