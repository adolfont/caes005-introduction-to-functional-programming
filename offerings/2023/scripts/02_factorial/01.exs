# Recursive anonymous function
# https://chat.openai.com/c/ffec3ccf-61e3-423e-be8c-aaff49471d83
# https://sharno.medium.com/an-anonymous-recursive-function-in-elixir-2fe1e5e89e59
# https://levelup.gitconnected.com/implementing-recursion-with-the-y-combinator-in-any-language-9e83fa369ca

factorial_aux = fn
  0, _ -> 1
  n, f when is_integer(n) and n > 0 -> n * f.(n - 1, f)
  _, _ -> "Input must be a non-negative integer"
end

factorial = fn n ->
  factorial_aux.(n, factorial_aux)
end

IO.write("Type an integer number: ")
input = IO.gets("")

IO.puts("You entered: #{input}")

case Integer.parse(String.trim(input)) do
  {integer_result, ""} ->
    IO.puts("The factorial of #{integer_result} is #{factorial.(integer_result)}")

  _ ->
    IO.puts("Invalid integer format.")
end
