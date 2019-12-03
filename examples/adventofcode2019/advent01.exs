defmodule Advent01 do
  @moduledoc """
  Documentation for Advent01.
  """
  
  def fuel(x) do
    div(x, 3) - 2
  end

  def mass(y) when y<=0, do: 0
  
  def mass(x) do
    (if (fuel(x)<0), do: 0, else: fuel(x)) + mass(fuel(x))
  end

end

# Part 1
File.read!("input.txt")
|> String.split("\n")
|> Enum.map(&String.to_integer/1)
|> Enum.map(&Advent01.fuel/1)
|> Enum.sum()
|> IO.inspect()

# Part 2
File.read!("input.txt")
|> String.split("\n")
|> Enum.map(&String.to_integer/1)
|> Enum.map(&Advent01.mass/1)
|> Enum.sum()
|> IO.inspect()
