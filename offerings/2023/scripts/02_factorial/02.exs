# Fixed-point combinator https://en.wikipedia.org/wiki/Fixed-point_combinator


y = fn f ->
  (fn x -> f.(fn v -> x.(x).(v) end) end)
  .(fn x -> f.(fn v -> x.(x).(v) end) end)
end

factorial = y.(fn f ->
  fn
    0 -> 1
    n -> n * f.(n - 1)
  end
end)



IO.write("Type an integer number: ")
input = IO.gets("")

IO.puts("You entered: #{input}")

case Integer.parse(String.trim(input)) do
  {integer_result, ""} ->
    IO.puts("The factorial of #{integer_result} is #{factorial.(integer_result)}")

  _ ->
    IO.puts("Invalid integer format.")
end
