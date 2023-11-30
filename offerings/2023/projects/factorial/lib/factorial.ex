defmodule Factorial do
  def main([string]) do
    case Integer.parse(string) do
      {number, ""} when number >= 0 ->
        IO.puts("factorial #{number} = #{Calculator.fac(number)}")
        possible_loop()

      :error ->
        IO.puts("Your input must be an integer number larger or equal to zero!")
        possible_loop()

      _ ->
        IO.puts("Your input must be an integer number larger or equal to zero!")
        possible_loop()
    end
  end

  def main(_) do
    usage()
  end

  defp usage() do
    IO.puts("usage: factorial integer")
  end

  defp possible_loop() do
    choice = String.trim(IO.gets("Do you want to continue? (Y/N): "))

    case choice do
      "Y" ->
        another_factorial()

      _ ->
        IO.puts("Bye!")
        exit(:normal)
    end
  end

  defp another_factorial() do
    possible_number = String.trim(IO.gets("Type another number: "))
    main([possible_number])
  end
end
