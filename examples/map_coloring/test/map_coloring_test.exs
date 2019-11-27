defmodule MapColoringTest do
  use ExUnit.Case
  doctest MapColoring

  test "First Valid Coloring" do
    assert MapColoring.color_first() == {:red, :green, :green, :blue, :blue}
  end

  test "All Valid Colorings" do
    assert MapColoring.color_all() == [
             {:red, :green, :green, :blue, :blue},
             {:red, :blue, :blue, :green, :green},
             {:green, :red, :red, :blue, :blue},
             {:green, :blue, :blue, :red, :red},
             {:blue, :red, :red, :green, :green},
             {:blue, :green, :green, :red, :red}
           ]
  end

  test "Show Coloring" do
    assert MapColoring.show_coloring(MapColoring.color_first()) ==
             """
             Alabama = red
             Missisipi = green
             Georgia = green
             Tennesse =  blue
             Florida =  blue
             """
  end
end
