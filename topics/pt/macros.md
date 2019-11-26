# Macros em Elixir

Links:
- https://elixir-lang.org/getting-started/meta/macros.html
- https://elixirschool.com/pt/lessons/advanced/metaprogramming/

Macros devem ser usadas apenas em último caso!

Vamos salvar o código em [macros.exs](https://github.com/adolfont/introducao-a-programacao-funcional/blob/master/examples/macros.exs) e executá-lo com `elixir macros.exs`  
ou com `iex macros.exs`.

# Primeiro Teste

~~~
iex

require AMenosQue

AMenosQue.macro_amenosque true, do: IO.puts "Isto nunca deveria ser impresso!"

AMenosQue.funcao_amenosque true, do: IO.puts "Isto nunca deveria ser impresso!"
~~~

## Por que isto acontece?

~~~
iex(3)> AMenosQue.funcao_amenosque true, do: IO.puts "Isto nunca deveria ser impresso!"
Isto nunca deveria ser impresso!
nil


~~~

## Veja o que está acontecendo

~~~
iex>

expr = quote do: AMenosQue.macro_amenosque true, do: IO.puts "Isto nunca deveria ser impresso!"

res  = Macro.expand_once(expr, __ENV__)

IO.puts Macro.to_string(res)
~~~

`unless/2` é implementado em Elixir como uma macro.

`defmacro/2`, `def/2`, `defprotocol/2`, e muitos outros são implementados em Elixir puro, frequentemente como uma macro.

