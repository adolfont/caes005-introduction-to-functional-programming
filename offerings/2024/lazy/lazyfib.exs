# Private link https://claude.ai/chat/87e8d68e-5414-45b3-b74b-c99a3247e70a
defmodule LazyFib do
  def fibonacci_stream do
    Stream.unfold({1, 1}, fn {a, b} -> {a, {b, a + b}} end)
  end

  def main do
    # Get first 10 Fibonacci numbers
    first_10 =
      fibonacci_stream()
      |> Stream.take(10)
      |> Enum.to_list()

    IO.puts("First 10 Fibonacci numbers:")
    IO.inspect(first_10)

    # Get first 1000 Fibonacci numbers
    first_1000_length =
      fibonacci_stream()
      |> Stream.take(1000)
      |> Enum.to_list()
      |> length()

    IO.puts("\nLength of first 1000 Fibonacci numbers:")
    IO.puts(first_1000_length)
  end
end

# Run the program
LazyFib.main()
