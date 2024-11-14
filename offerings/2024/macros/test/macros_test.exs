defmodule MacrosTest do
  use ExUnit.Case

  require Macros

  test "Macro that returns 'Hello, World!'" do
    result =
      Macros.hello(true, complement: "Wor" <> "ld!")

    assert result == "Hello, World!"
  end
end
