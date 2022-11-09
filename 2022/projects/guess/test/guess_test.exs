defmodule GuessTest do
  use ExUnit.Case
  doctest Guess

  test "greets the world" do
    assert Guess.hello() == :world
  end
end
