defmodule Maffetone do
  def limite_superior(idade) do
    180 - idade
  end

  def limite_superior(idade, true) do
    limite_superior(idade) - 10
  end

  def limite_superior(idade, false) do
    limite_superior(idade)
  end

  def limite_inferior(idade) do
    limite_superior(idade) - 10
  end

  def limite_inferior(idade, true) do
    limite_inferior(idade) - 10
  end

  def limite_inferior(idade, false) do
    limite_inferior(idade)
  end

  def intervalo(idade) do
    {limite_inferior(idade), limite_superior(idade)}
  end
end

IO.puts("Cálculo da Fórmula Maffetone")
idade = 40
IO.puts("Limite inferior para #{idade} anos: #{Maffetone.limite_inferior(idade)}")
IO.puts("Limite superior para #{idade} anos: #{Maffetone.limite_superior(idade)}")
IO.puts("Intervalo para #{idade} anos: ")
IO.inspect(Maffetone.intervalo(idade))

condicao = true

IO.puts(
  "Limite inferior para #{idade} anos: #{Maffetone.limite_inferior(idade, condicao)} para condicao a sendo #{
    condicao
  }"
)

IO.puts(
  "Limite superior para #{idade} anos: #{Maffetone.limite_superior(idade, condicao)} para condicao a sendo #{
    condicao
  }"
)

condicao = false

IO.puts(
  "Limite inferior para #{idade} anos: #{Maffetone.limite_inferior(idade, condicao)} para condicao a sendo #{
    condicao
  }"
)

IO.puts(
  "Limite superior para #{idade} anos: #{Maffetone.limite_superior(idade, condicao)} para condicao a sendo #{
    condicao
  }"
)
