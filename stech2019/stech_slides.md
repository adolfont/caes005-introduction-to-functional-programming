---
title: 
- Introdução a Elixir
subtitle:
- Linguagem brasileira utilizada em todo o mundo
date:
- 20 de novembro de 2019
author: 
- Adolfo Neto <http://bit.ly/adolfont>
theme: Copenhagen
theme: Madrid
colortheme: dolphin
fontfamily: noto-sans
aspectratio: 169
header-includes:
- \usepackage{cmbright}
fontsize: 20pt
---

# Exemplo de código

```elixir
defmodule Matematica do
    def fatorial(1), do: 1
    def fatorial(x) when x>1 do
        x * fatorial(x-1)
    end
end
```

# Instalação


## Linux

Algumas distribuições têm pacotes atualizados.
Eu uso Mint com [asdf](https://elixirschool.com/blog/asdf-version-management/).

## Windows

[Instalação direta](https://repo.hex.pm/elixir-websetup.exe) ou usando [Chocolatey](https://chocolatey.org/).

# Instalação

## MacOS

[Brew or Macports](https://elixir-lang.org/install.html#macos)

## Outros

Ver [Instalando Elixir](https://elixir-lang.org/install.html)

# Verificando a versão instalada

```
elixir --version
elixir -v
```

# Testando

\small
```
> iex

iex(1)> 4 + 5
9
iex(2)> div(7,3)
2
iex(3)> rem(7,3)
1
```

# Variáveis e Tipos Básicos

- Inteiros
- Números de Ponto Flutuante
- Strings
- Átomos

# Casamento de Padrões

<https://gist.github.com/adolfont/d5a101f8785662d9b8e4c55eef9c4ec2>

# Funções predefinidas

- Chamada de funções `Módulo.nome`

- Kernel

- (h)elp

- Atom

- String

<!--
- Alguns módulos que já vêm com Elixir:
  - Kernel https://hexdocs.pm/elixir/Kernel.html
  - No iex, Kernel. e TAB
  - funções do Módulo Kernel não precisam do nome do Módulo antes
  - h Kernel.trunc  round  abs is_integer
  - h Kernel
  - https://hexdocs.pm/elixir/Atom.html#summary
    - Atom.to_string
    - Também não precisa do nome do Módulo  
  - https://hexdocs.pm/elixir/String.html#summary
    - String.replace("a,b,c", ",", "-") 
    - precisa do nome do Módulo 
-->




# Agradecimentos

## Projeto Emílias

<http://emilias.dainf.ct.utfpr.edu.br/>

## Elixir Forum

<https://elixirforum.com/>

## Elixir Brasil no Telegram

<https://t.me/elixirbr>