defmodule Guess.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  @max 10

  def start_game do
    Shell.cmd("clear")
    welcome_message()
    play_game(Enum.random(1..@max))
  end

  def play_game(sorted_number) do
    choice = get_number()

    cond do
      choice == -1 ->
        Shell.info("Bye bye! See you next time!")

      choice == sorted_number ->
        Shell.info("You won!")
        Shell.info("")
        play_game(Enum.random(1..@max))

      choice == :error ->
        Shell.info("You must type an integer number!")
        Shell.info("")
        play_game(Enum.random(1..@max))

      true ->
        try_again(sorted_number)
    end
  end

  defp welcome_message do
    Shell.info("== Guess Game ==")
    Shell.info("Guess the right number.")
  end

  defp get_number() do
    try do
      Shell.prompt("Type an integer number between 1 and 100 (-1 to quit): ")
      |> String.trim()
      |> String.to_integer()
    rescue
      ArgumentError -> :error
    end
  end

  defp try_again(sorted_number) do
    Shell.info("You lost! Try again!")
    Shell.info("")
    play_game(sorted_number)
  end
end
