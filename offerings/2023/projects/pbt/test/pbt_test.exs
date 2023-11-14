defmodule PbtTest do
  use ExUnit.Case
  doctest Pbt

  test "Sorts a number between 1 and 100" do
    number = Pbt.hello(1, 100)
    assert (number > 0) and (number < 101)
  end
end
