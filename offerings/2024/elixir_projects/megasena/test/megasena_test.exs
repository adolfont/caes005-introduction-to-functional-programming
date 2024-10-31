defmodule MegasenaTest do
  use ExUnit.Case
  doctest Megasena

  test "greets the world" do
    assert Megasena.hello() == :world
  end
end
