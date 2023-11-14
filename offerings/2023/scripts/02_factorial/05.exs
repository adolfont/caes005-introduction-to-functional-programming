defmodule Factorial do
  def of(0), do: 1
  def of(1), do: 1

  def of(n) when is_integer(n) and n > 1 do
    n * of(n - 1)
  end

  def interface() do
    IO.write("Type an integer and non-negative number: ")
    input = IO.gets("")

    IO.puts("You entered: #{input}")

    case Integer.parse(String.trim(input)) do
      {integer_result, ""} ->
        show_message(integer_result)

      :error ->
        IO.puts("Invalid integer format.\n")
    end

    interface()
  end

  def show_message(value) when value >= 0 do
    IO.puts("The factorial of #{value} is #{Factorial.of(value)}. \n")
  end

  def show_message(-1) do
    IO.puts("Bye. \n")
    exit(:normal)
  end

  def show_message(_) do
    IO.puts("Error! It should have been an integer and non-negative number.\n")
  end
end

Factorial.interface()
