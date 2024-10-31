defmodule MegaSena do

  def main(tries, numbers, guesses) do
    MegaSena.Server.new(numbers)
    MegaSena.Player.new(guesses, numbers)
    MegaSena.Player.play(tries)
  end
end
