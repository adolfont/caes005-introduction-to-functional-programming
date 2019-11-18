---
title: 
- Projetos em Elixir
subtitle:
- Usando mix
date:
- 19 de novembro de 2019
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

# Organizando um Projeto


+ Organizar o código-fonte
+ Escrever testes
+ Gerenciar dependências
+ Seguir convenções do Elixir

# Mix

[mix](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html) é a ferramenta de construção (*build*) de projetos do Elixir

# mix help

Lista as opções do mix.

\tiny

```
> mix help

mix                   # Runs the default task (current: "mix run")
mix app.start         # Starts all registered apps
mix app.tree          # Prints the application tree
mix archive           # Lists installed archives
(...)
mix run               # Starts and runs the current application
mix test              # Runs a project's tests
mix xref              # Performs cross reference checks
iex -S mix            # Starts IEx and runs the default task
```


# mix new

\> mix new \<nome_do_projeto\>

>

\> mix new issues

\> cd issues

\> mix test

# Editor de código

- code
- atom
- emacs
- vim
- nano, pico

# Usando code

Você já está na onde estão todos os arquivos criados.

Logo, basta fazer:

\> code .

# Arquivos criados

\begin{center}
  \includegraphics[width=0.3\textwidth]{./mix1.png}
\end{center}

# Controle de Versão com  git

\> git init

\> git add .

\small

\> git commit -m "Commit inicial do novo projeto"

# Controle de versão com git

\tiny 
~~~~~~~
adolfo@Adolfo-pc:~/Elixir/issues$ git commit -m "Commit inicial do novo projeto"
[master (root-commit) 9df8c84] Commit inicial do novo projeto
 7 files changed, 104 insertions(+)
 create mode 100644 .formatter.exs
 create mode 100644 .gitignore
 create mode 100644 README.md
 create mode 100644 lib/issues.ex
 create mode 100644 mix.exs
 create mode 100644 test/issues_test.exs
 create mode 100644 test/test_helper.exs
~~~~~~~


# Criar issues/cli.ex

[cli.ex](http://media.pragprog.com/titles/elixir16/code/project/0/issues/lib/issues/cli.ex)

# Escrever testes básicos

[issues_test.exs](http://media.pragprog.com/titles/elixir16/code/project/1/issues/test/cli_test.exs)

# mix test

\tiny
~~~
adolfo@Adolfo-pc:~/Elixir/issues$ mix test
.
  1) test three values returned if three given (CliTest)
     test/issues_test.exs:20
     Assertion with == failed
     code:  assert parse_args(["user", "project", "99"]) == {"user", "project", 99}
     left:  {"user", "project", "99"}
     right: {"user", "project", 99}
     stacktrace:
       test/issues_test.exs:21: (test)
..

Finished in 0.4 seconds
1 doctest, 3 tests, 1 failure

Randomized with seed 783323
~~~

# Novo cli.ex

[cli.ex](http://media.pragprog.com/titles/elixir16/code/project/1/issues/lib/issues/cli.ex)

# mix test, novamente

\tiny
~~~
adolfo@Adolfo-pc:~/Elixir/issues$ mix test
Compiling 1 file (.ex)
....

Finished in 0.2 seconds
1 doctest, 3 tests, 0 failures

Randomized with seed 808118
~~~

# Refatorar função grande

[Novo cli.ex](https://gist.github.com/adolfont/4863e4fc5cf428b5e40fa0f423c6a929)

`mix test` novamente

# Nova versão de cli.ex


[cli.ex](http://media.pragprog.com/titles/elixir16/code/project/1a/issues/lib/issues/cli.ex)

\tiny
~~~
adolfo@Adolfo-pc:~/Elixir/issues$ mix run -e 'Issues.CLI.run(["-h"])'
Compiling 1 file (.ex)
warning: function Issues.GithubIssues.fetch/2 is undefined (module Issues.GithubIssues is not available)
  lib/issues/cli.ex:33

usage: issues <user> <project> [ count | 4 ]
~~~

# Aviso vs. Erro

mix run -e 'Issues.CLI.run(["elixir-lang", "elixir"])'

\tiny
~~~
adolfo@Adolfo-pc:~/Elixir/issues$ mix run -e 'Issues.CLI.run(["elixir-lang", "elixir"])'
** (UndefinedFunctionError) function Issues.GithubIssues.fetch/2 is undefined (module Issues.GithubIssues is not available)
    Issues.GithubIssues.fetch("elixir-lang", "elixir")
    (stdlib) erl_eval.erl:680: :erl_eval.do_apply/6
    (elixir) lib/code.ex:240: Code.eval_string/3
    (elixir) lib/enum.ex:783: Enum."-each/2-lists^foreach/1-0-"/2
    (elixir) lib/enum.ex:783: Enum.each/2
    (mix) lib/mix/tasks/run.ex:141: Mix.Tasks.Run.run/5
    (mix) lib/mix/tasks/run.ex:85: Mix.Tasks.Run.run/1
~~~

# Encontrar Bibliotecas

- <http://elixir-lang.org/docs.html>
- <http://erlang.org/doc>
- <https://hex.pm>

# Adicionar Bibliotecas a Seu Projeto

Novo [mix.exs](https://gist.github.com/adolfont/4d3efc2b19784729a4750a0d7ac181c0)

\> mix deps

\> mix deps.get

\> mix deps.compile

# GithubIssues

[github_issues.ex](http://media.pragprog.com/titles/elixir16/code/project/1a/issues/lib/issues/github_issues.ex)

\> iex -S mix

\> iex> Issues.GithubIssues.fetch("elixir-lang", "elixir")

# Adicionar Poison a mix.exs

~~~
{ :poison, "~> 3.1" },
~~~

# Novo GithubIssues e novo Issues.CLI

[github_issues.ex](http://media.pragprog.com/titles/elixir16/code/project/3/issues/lib/issues/github_issues.ex)

[cli.ex](http://media.pragprog.com/titles/elixir16/code/project/3/issues/lib/issues/cli.ex)

# Configuração da Aplicação

Versão [1.9](https://elixir-lang.org/blog/2019/06/24/elixir-v1-9-0-released/) deprecou Mix.Config!

\small
~~~
echo "use Mix.Config" > config/config.exs
~~~

[config.exs](http://media.pragprog.com/titles/elixir16/code/project/3a/issues/config/config.exs)

[github_issues.ex](http://media.pragprog.com/titles/elixir16/code/project/3a/issues/lib/issues/github_issues.ex)
