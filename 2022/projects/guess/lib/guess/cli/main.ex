defmodule Guess.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    Shell.cmd("clear")
    welcome_message()
    play_game()
  end

  def play_game() do
    sorted_number = Enum.random(1..100)

    # Shell.info("The number is #{sorted_number}.")

    {choice, _} =
      Shell.prompt("Type a number between 1 and 100 (-1 to quit): ")
      |> Integer.parse()

    cond do
      choice == -1 ->
        Shell.info("Bye bye! See you next time!")

      choice == sorted_number ->
        Shell.info("You won!")
        Shell.info("")
        play_game()

      true ->
        Shell.info("You lost! The number was #{sorted_number}.")
        Shell.info("")
        play_game()
    end
  end

  defp welcome_message do
    Shell.info("== Guess Game ==")
    Shell.info("Guess the right number.")
  end
end
