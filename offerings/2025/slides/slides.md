% Programação Funcional com Elixir
% Adolfo Neto
% Junho de 2025

# Objetivos da Apresentação

- Introduzir os principais conceitos da programação funcional
- Mostrar como esses conceitos são aplicados em Elixir
- Apresentar exemplos práticos de código
- Comparar com outros paradigmas
- Discutir benefícios e desafios

---

# O que é Programação Funcional?

- Paradigma baseado no uso de funções puras
- Evita estados mutáveis e efeitos colaterais
- Ênfase em:
  - Imutabilidade
  - Recursão
  - Funções de ordem superior
  - Composição

---

# O que são funções?

- Carnielli-Epstein

---


# Elixir: uma linguagem funcional

- Criada por José Valim
- Executa na BEAM (máquina virtual do Erlang)
- Suporte robusto para concorrência e tolerância a falhas
- Sintaxe moderna, inspirada em Ruby
- Funcional desde o núcleo

---


# Funções Nomeadas

```elixir
defmodule Matematica do
  def dobro(x), do: x * 2
  def quadrado(x), do: x * x
end

IO.puts Matematica.dobro(5)     # 10
IO.puts Matematica.quadrado(4)  # 16
````

* Organizadas em módulos
* Chamadas com nome do módulo e ponto
* Podem ter múltiplas cláusulas


---


# Funções com _Pattern Matching_ (e múltiplas cláusulas)

```elixir
defmodule Fatorial do
  def calcular(0), do: 1
  def calcular(n), do: n * calcular(n - 1)
end

IO.puts Fatorial.calcular(5)  # 120
```

* Pattern matching direto nos parâmetros
* Alternativa poderosa a `if`/`else`


---


# Funções Anônimas

```elixir
dobro = fn x -> x * 2 end
IO.puts dobro.(10)  # 20
```

* Criadas com `fn -> end`
* Executadas com `.()`
* Úteis para funções de ordem superior

---


# Funções de Ordem Superior

```elixir
aplicar = fn f, valor -> f.(valor) end

incrementar = fn x -> x + 1 end

IO.puts aplicar.(incrementar, 9)  # 10
```

* Recebem ou retornam funções
* Fundamento de `Enum` e `Stream`

---

# Composição de Funções

```elixir
multiplica_por_2 = fn x -> x * 2 end
adiciona_3 = fn x -> x + 3 end

compor = fn f, g ->
  fn x -> f.(g.(x)) end
end

nova_funcao = compor.(multiplica_por_2, adiciona_3)

IO.puts nova_funcao.(4)  # (4 + 3) * 2 = 14
```

* Composição: f(g(x))
* Cria funções mais complexas a partir de funções simples

---


# Variáveis são Imutáveis

```elixir
x = 10
x = x + 1  # Isso não reatribui: cria um novo `x`

IO.puts x  # 11
```

* Sem mutação de estado
* Reduz bugs em ambientes concorrentes

---

# Listas e Enum

```elixir
lista = [1, 2, 3, 4]

Enum.map(lista, fn x -> x * 2 end)
|> IO.inspect  # [2, 4, 6, 8]
```

* Operações funcionais sobre coleções
* `Enum`, `Stream`, `MapSet` etc.

---

# Pipelines (|>)

```elixir
" elixir "
|> String.trim()
|> String.upcase()
|> IO.puts()  # ELIXIR
```

* Torna o código mais legível
* Passa o resultado de uma função como argumento da próxima

---

# Recursão no lugar de laços

```elixir
defmodule Contador do
  def contar(0), do: IO.puts("Fim")
  def contar(n) do
    IO.puts(n)
    contar(n - 1)
  end
end

Contador.contar(3)
```

* Recurso natural em linguagens funcionais
* Tail-call optimization (otimização de chamada de cauda)

---

# Match e Guards

```elixir
defmodule Paridade do
  def verifica(n) when rem(n, 2) == 0, do: "par"
  def verifica(_), do: "ímpar"
end

IO.puts Paridade.verifica(4)  # par
IO.puts Paridade.verifica(3)  # ímpar
```

* `when` restringe execução da cláusula
* Ajuda a evitar lógica complicada com `if`

---

# Closures

```elixir
fabrica_multiplicador = fn fator ->
  fn x -> x * fator end
end

multiplica_por_10 = fabrica_multiplicador.(10)
IO.puts multiplica_por_10.(5)  # 50
```

* Funções que capturam o ambiente onde foram definidas
* Base para currying e geração de funções personalizadas

---

# Comparação com OO

| Conceito OO    | Equivalente Funcional         |
| -------------- | ----------------------------- |
| Objeto         | Estrutura + funções puras     |
| Métodos        | Funções em módulos            |
| Estado mutável | Dados imutáveis               |
| Herança        | Composição de funções/módulos |
| Loops          | Recursão                      |


---


# Vantagens da Programação Funcional

* Menos efeitos colaterais
* Concorrência segura
* Código mais declarativo e legível
* Facilidade de teste

---

# Desvantagens / Desafios

* Curva de aprendizado inicial
* Pensamento diferente do imperativo
* Performance em certos contextos pode ser menor
* Depuração de pipelines longos pode ser difícil

---

# Elixir na Prática

* Usado por empresas como Discord e Remote.
* Excelente para aplicações distribuídas e tolerantes a falhas
* Produtividade com `mix`, `iex`, `Phoenix`, `LiveView`

---

# Conclusão

* Elixir é uma ótima porta de entrada para programação funcional
* Aproveita robustez da BEAM com sintaxe amigável
* Incentiva boas práticas desde o início
* Comece escrevendo funções puras, usando `Enum`, `Stream`, `|>` e explorando `iex`

---

# Referências

* [Elixir School](https://elixirschool.com)
* [Programming Elixir 1.6 – Dave Thomas](https://pragprog.com)
* [Learn You Some Erlang](https://learnyousomeerlang.com)
* Documentação oficial: [https://elixir-lang.org](https://elixir-lang.org)



---

### Como usar:

1. Salve esse conteúdo como `slides.md`
2. Gere o PDF:

```bash
pandoc -t beamer -V theme:metropolis -o slides.pdf slides.md
````


