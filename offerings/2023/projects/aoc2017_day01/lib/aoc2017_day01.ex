defmodule Aoc2017Day01 do
  def task1(input) do
    input
    |> creates_a_list_of_integers()
    |> Enum.chunk_every(2, 1)
    |> Enum.reverse()
    |> tl
    |> Enum.reverse()
    |> Enum.reduce(0, fn element, acc -> acc + check_pairs(element) end)
  end

  defp creates_a_list_of_integers(input) do
    list = String.codepoints(input)

    new_list = list ++ [hd(list)]

    new_list
    |> Enum.map(&String.to_integer/1)
  end

  defp creates_a_list_of_integers_task2(input) do
    input
    |> String.codepoints()
    |> Enum.map(&String.to_integer/1)
  end

  @doc """
  An auxiliary function that returns zero when the arguments are different
  And that returns the number when the two arguments are that number.
  """
  def check_pairs([n, n]), do: n
  def check_pairs([_, _]), do: 0

  def task2(input) do
    map =
      input
      |> creates_a_list_of_integers_task2()
      |> create_a_map()

    len = length(Map.keys(map))

    map
    |> Enum.reduce(
      0,
      fn {index, value}, acc -> acc + check_pairs([value, map[rem(index + div(len, 2), len)]]) end
    )
  end

  defp create_a_map(list) do
    list
    |> Enum.with_index()
    |> Enum.map(fn {x, y} -> {y, x} end)
    |> Map.new()
  end
end
