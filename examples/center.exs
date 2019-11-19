defmodule Center do
  require Integer

  def center(string_list) do
    size_max = string_list |> Enum.max_by(&String.length/1) |> String.length()

    Enum.map(string_list, fn x -> show(x, size_max) end)
  end

  defp show(string, size_max) do
    length = String.length(string)
    left = div(size_max - length, 2)
    #    if (Integer.is_odd(size_max-length)), do: left = left - 1
    string |> String.pad_leading(length + left) |> String.pad_trailing(size_max) |> IO.puts()
  end
end

Center.center(["cat", "zebra", "elephant", "elepahnt", "lephan"])
IO.puts("")
Center.center(["cat", "zebra", "elephant"])
IO.puts("")
Center.center(["cat", "zebra", "lephan"])
IO.puts("")
Center.center(["cat", "zebra", "elephant", "lephan"])
