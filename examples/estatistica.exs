defmodule Estatistica do
# http://dojopuzzles.com/problemas/exibe/calculando-estatisticas-simples/
  
  def mostra(lista) do
    IO.puts("Valor mínimo: #{valorMinimo(lista)}")
    IO.puts("Valor máximo: #{valorMaximo(lista)}")
    IO.puts("Número de elementos na sequência: #{tamanho(lista)}")
    IO.puts("Valor médio: #{valorMedio(lista)}")
  end

  def valorMinimo([head|tail]) do
    limite(head,tail, &(&1 < &2))
  end

  def valorMaximo([head|tail]) do
    limite(head,tail, &(&1 > &2))
  end

  def tamanho([]), do: 0

  def tamanho([_|tail]) do
      1 + tamanho(tail)
  end

  def valorMedio(lista) do
    soma(lista)/tamanho(lista)
  end

  defp soma([]), do: 0

  defp soma([head|tail]) do
      head + soma(tail)
  end

  defp limite(limite_ate_agora,[], _) do
    limite_ate_agora
  end

  defp limite(limite_ate_agora,[head|tail], f) do
    if f.(head, limite_ate_agora) do
      limite(head,tail,f)
    else
      limite(limite_ate_agora,tail,f)
    end
  end


end
