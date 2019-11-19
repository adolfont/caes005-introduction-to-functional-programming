defmodule Fatorial do
  def fat(1), do: 1
  def fat(n), do: n * fat(n-1)

# https://inquisitivedeveloper.com/lwm-elixir-35/
  def of(n), do: of(n, 1)
  defp of(0, current_factorial), do: current_factorial
  defp of(n, current_factorial) when n > 0, do: of(n - 1, current_factorial * n)

  def of_2(0), do: 1
	def of_2(n) when n > 0 do
		Enum.reduce(1..n, fn (x, fact) -> fact * x end)
	end

 def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end

# testar com 400000
entrada = IO.gets("Digite um número: ")
numero =  entrada |> String.trim() |> String.to_integer()

# IO.puts("O fatorial de #{numero} é #{Fatorial.of_2(numero)}")
# IO.puts("O fatorial de #{numero} é #{Fatorial.of(numero)}")
# IO.puts("O fatorial de #{numero} é #{Fatorial.fat(numero)}")

IO.puts("O tempo para calcular o fatorial de #{numero} é #{Fatorial.measure(fn -> Fatorial.of_2(numero) end)}")
IO.puts("O tempo para calcular o fatorial de #{numero} é #{Fatorial.measure(fn -> Fatorial.of(numero) end)}")
IO.puts("O tempo para calcular o fatorial de #{numero} é #{Fatorial.measure(fn -> Fatorial.fat(numero) end)}")
