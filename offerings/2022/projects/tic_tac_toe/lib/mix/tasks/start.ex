defmodule Mix.Tasks.Start do
  use Mix.Task

  def run(_), do: TicTacToe.CLI.Main.start_game()
end
