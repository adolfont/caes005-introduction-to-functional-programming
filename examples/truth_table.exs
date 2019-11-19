defmodule TruthTable do
  @values [0, 1]

  def values(n) when n > 1 do
    for z <- @values, l <- values(n - 1), do: [z | l]
  end

  def values(1) do
    for x <- @values, do: [x]
  end
end

for x <- 1..4 do
  IO.puts("Number of atoms: #{x}")
  IO.inspect(TruthTable.values(x))
  IO.puts("")
end
