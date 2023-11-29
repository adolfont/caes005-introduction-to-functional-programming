defmodule Tasks do
  def play do
    IO.puts("Starting a game")

    player_1_name = String.trim(IO.gets("Tell me you name: "))

    IO.puts("Welcome, #{player_1_name}!")

    play("10", player_1_name)
  end

  defp play(number, name) do
    choice = String.trim(IO.gets("What's the number: "))

    if choice == number do
      IO.puts("Congrats, #{name}! That's the right number!")
      exit(:normal)
    else
      IO.puts("Sorry, #{name}! Please try again!")
      IO.puts "X___\n" <> "____\n" <> "____\n" <> "___O"
      play(number, name)
    end
  end
end
