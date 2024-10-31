defmodule Deffunc do
  @moduledoc """
  Documentation for `Deffunc`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Deffunc.hello()
      :world

  """
  def hello() do
    :world
  end

  def imprime_nome(keyword_list) do
    meio =
      if keyword_list[:nomes_do_meio] != nil do
        keyword_list[:nomes_do_meio] <> " "
      else
        ""
      end

    keyword_list[:nome] <> " " <> meio <> keyword_list[:sobrenome]
  end
end
