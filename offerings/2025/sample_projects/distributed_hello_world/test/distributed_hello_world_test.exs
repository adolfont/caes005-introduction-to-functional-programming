defmodule DistributedHelloWorldTest do
  use ExUnit.Case
  doctest DistributedHelloWorld

  test "greets the world" do
    assert DistributedHelloWorld.hello() == :world
  end
end
