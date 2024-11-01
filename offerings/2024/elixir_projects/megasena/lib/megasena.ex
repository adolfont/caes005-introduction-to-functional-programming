defmodule MegaSena do
  def main(tries) do
    # Start the game by calling the `play` function in `MegaSena.Player`
    MegaSena.Player.play(tries)
  end
end
