defmodule Macros do
  defmacro hello(expr, complement: block) do
    quote do
      if unquote(expr), do: "Hello, " <> unquote(block)
    end
  end

  defmacro defmath(operations) do
    operations
    |> Enum.map(fn op ->
      case op do
        :add ->
          quote do
            def add(a, b), do: a + b
          end

        :subtract ->
          quote do
            def subtract(a, b), do: a - b
          end

        :multiply ->
          quote do
            def multiply(a, b), do: a * b
          end

        :divide ->
          quote do
            def divide(a, b) when b != 0, do: a / b
            def divide(_, 0), do: raise(ArgumentError, "Cannot divide by zero")
          end

        _ ->
          raise ArgumentError, "Unsupported operation: #{op}"
      end
    end)
    |> Enum.reduce(fn quoted_expr, acc ->
      quote do
        unquote(acc)
        unquote(quoted_expr)
      end
    end)
  end
end
