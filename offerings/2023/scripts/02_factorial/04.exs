defmodule Factorial do
  def of(0), do: 1
  def of(1), do: 1

  def of(n) when is_integer(n) and n > 1 do
    n * of(n - 1)
  end

  def interact() do
    IO.write("Type an integer number: ")
    input = IO.gets("")

    IO.puts("You entered: #{input}")

    case Integer.parse(String.trim(input)) do
      {integer_result, ""} ->
        IO.puts("The factorial of #{integer_result} is #{Factorial.of(integer_result)}")

      _ ->
        IO.puts("Invalid integer format.")
    end
  end
end

Factorial.interact()
