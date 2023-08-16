defmodule Mix.Tasks.Start do
  use Mix.Task

  def run(_), do: Guess.CLI.Main.start_game()
end
