defmodule AMenosQue do
  def funcao_amenosque(clausula, do: expressao) do
    if(!clausula, do: expressao)
  end

  defmacro macro_amenosque(clausula, do: expressao) do
    quote do
      if(!unquote(clausula), do: unquote(expressao))
    end
  end
end

