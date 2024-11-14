defmodule Calculator do
  require Macros

  Macros.defmath([:add, :subtract, :multiply, :divide])
end
