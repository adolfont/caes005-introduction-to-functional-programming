defmodule Factorial.MixProject do
  use Mix.Project

  def project do
    [
      app: :factorial,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      ## THIS LINE WAS ADDED
      escript: escript()
    ]
  end

  defp escript do
    ## THIS LINE (and the Factorial module) were ADDED
    [main_module: Factorial]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
