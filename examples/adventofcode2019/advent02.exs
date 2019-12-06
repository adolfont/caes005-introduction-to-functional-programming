defmodule Advent02 do
  def readFile(filename) do
    File.read(filename)
  end

  def process(string) do
    String.split(string, ",")
    |> Enum.map(&String.to_integer/1)
    |> process_options(0)
    |> Enum.join(",")
  end

  defp process_options(all, cursor) when cursor < length(all) do
    case Enum.at(all, cursor) do
      1 -> do_operation(all, cursor, &Kernel.+/2)
      2 -> do_operation(all, cursor, &Kernel.*/2)
      99 -> all
    end
  end

  defp do_operation(all, cursor, operation) do
    op1_pos = Enum.at(all, cursor + 1)
    op2_pos = Enum.at(all, cursor + 2)
    result_pos = Enum.at(all, cursor + 3)

    value1 = Enum.at(all, op1_pos)
    value2 = Enum.at(all, op2_pos)

    List.replace_at(all, result_pos, operation.(value1, value2))
    |> process_options(cursor + 4)
  end

  def trim_and_replace(input, {pos1, value1}, {pos2, value2}) do
    input
    |> String.trim()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> List.replace_at(pos1, value1)
    |> List.replace_at(pos2, value2)
    |> Enum.join(",")
  end
end

ExUnit.start()

defmodule Advent02Test do
  use ExUnit.Case

  test "Tries to reads file and it works" do
    assert {:ok, _} = Advent02.readFile("input02.txt")
  end

  test "Processes examples" do
    inputs = [
      "1,9,10,3,2,3,11,0,99,30,40,50",
      "1,0,0,0,99",
      "2,3,0,3,99",
      "2,4,4,5,99,0",
      "1,1,1,4,99,5,6,0,99"
    ]

    outputs = [
      "3500,9,10,70,2,3,11,0,99,30,40,50",
      "2,0,0,0,99",
      "2,3,0,6,99",
      "2,4,4,5,99,9801",
      "30,1,1,4,2,5,6,0,99"
    ]

    for {x, y} <- Enum.zip(inputs, outputs) do
      assert Advent02.process(x) == y
    end
  end

  # part 1
  test "Processing AdventOfCode input with my file - Part 1" do
    {:ok, input} = Advent02.readFile("input02.txt")

    new_input = Advent02.trim_and_replace(input, {1, 12}, {2, 2})

    assert String.starts_with?(Advent02.process(new_input), "5290681,")
  end

  # part 2
  test "Processing AdventOfCode input with my file - Part 2" do
    {:ok, input} = Advent02.readFile("input02.txt")

    for noun <- 0..99, verb <- 0..99 do
      new_input = Advent02.trim_and_replace(input, {1, noun}, {2, verb})

      if String.starts_with?(Advent02.process(new_input), "19690720,") do
        # IO.puts("noun = #{noun}")
        # IO.puts("verb = #{verb}")
        # IO.puts("100 * noun + verb = #{100 * noun + verb}")
        assert 100 * noun + verb == 5741
      end
    end
  end
end
