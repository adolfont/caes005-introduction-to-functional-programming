defmodule CalculatorTest do
  use ExUnit.Case, async: true

  test "add/2 function adds two numbers" do
    assert Calculator.add(3, 5) == 8
  end

  test "subtract/2 function subtracts two numbers" do
    assert Calculator.subtract(10, 4) == 6
  end

  test "multiply/2 function multiplies two numbers" do
    assert Calculator.multiply(6, 7) == 42
  end

  test "divide/2 function divides two numbers" do
    assert Calculator.divide(20, 4) == 5.0
  end

  test "divide/2 raises ArgumentError when dividing by zero" do
    assert_raise ArgumentError, "Cannot divide by zero", fn ->
      Calculator.divide(10, 0)
    end
  end
end
