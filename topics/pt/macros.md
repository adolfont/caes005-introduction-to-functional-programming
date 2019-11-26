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