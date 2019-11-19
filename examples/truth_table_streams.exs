defmodule TruthTable do
  @values [0, 1]

  def values(n) when n > 1 do
    # for z <- @values, l <- values(n - 1), do: [z | l]
    for z <- @values, l <- values(n - 1), do: Stream.concat([z], l)
  end

  def values(1) do
    # for x <- @values, do: [x]
    for x <- @values, do: Stream.concat([], [x])
  end

  def print_max_lines(number_atoms, max_lines) do
    tt = TruthTable.values(number_atoms)

    for i <- 0..max_lines, i < :math.pow(2, number_atoms) do
      tt
      |> Enum.at(i)
      |> Enum.to_list()
      |> IO.inspect()
    end
  end

  def show() do
    max_atoms_answer = IO.gets("Type max number of atoms: ")

    max_atoms = String.to_integer(String.trim(max_atoms_answer))

    lines_answer = IO.gets("Type max number of lines: ")

    lines = String.to_integer(String.trim(lines_answer))

    for x <- 1..max_atoms do
      IO.puts("Number of atoms: #{x}")

      IO.puts("The first #{lines} lines of the truth table for #{x} atoms")

      TruthTable.print_max_lines(x, lines)

      IO.puts("")
    end
  end
end

TruthTable.show()
