defmodule DeffuncTest do
  use ExUnit.Case
  doctest Deffunc

  test "Imprime Nome e Sobrenome" do
    assert Deffunc.imprime_nome(nome: "Adolfo", sobrenome: "Neto") == "Adolfo Neto"
  end

  test "Imprime Nome, Nomes do Meio e Sobrenome" do
    assert Deffunc.imprime_nome(
             sobrenome: "Neto",
             nome: "Adolfo",
             nomes_do_meio: "Gustavo Serra Seca"
           ) == "Adolfo Gustavo Serra Seca Neto"
  end
end
