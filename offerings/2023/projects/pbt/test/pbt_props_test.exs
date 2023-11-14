defmodule PbtPropsTest do
  use ExUnit.Case
  use PropCheck


  # doctest Pbt

  # test "greets the world" do
  #   assert Pbt.hello() == :world
  # end

  property "Hello is between two numbers", [:verbose, numtests: 1000] do
    forall p <- integer() do
      IO.puts "p is #{p}"
      Pbt.hello(p,p+1000) > p
    end
  end
end
