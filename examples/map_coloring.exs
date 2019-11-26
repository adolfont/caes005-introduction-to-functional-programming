defmodule MapColoring do
  @moduledoc """
  This module implements two functions (color_first/0 and color_all/0) to solve 
  the map   coloring problem as presented in 
  page 11 of https://media.pragprog.com/titles/btlang/prolog.pdf 
  (Seven Languages in Seven Weeks by Bruce Tate).

  As described there:
  "We  want  to  color  a  map  of  the  southeastern United States. 
  We’ll cover the states shown in Figure 4, Map of some south-eastern states, 
  on page 12. We do not want two states of the same color to touch."


  """

  @colors [:red, :green, :blue]

  defp generate_all_colorings() do
    for(
      alabama <- @colors,
      missisipi <- @colors,
      georgia <- @colors,
      tennesse <- @colors,
      florida <- @colors,
      do: {alabama, missisipi, georgia, tennesse, florida}
    )
  end

  defp correct_coloring_helper(coloring, accumulator) do
    {alabama, missisipi, georgia, tennesse, florida} = coloring

    if _color(alabama, missisipi, georgia, tennesse, florida) do
      {:halt, accumulator ++ [coloring]}
    else
      {:cont, accumulator}
    end
  end

  defp correct_coloring_helper(coloring) do
    {alabama, missisipi, georgia, tennesse, florida} = coloring

    _color(alabama, missisipi, georgia, tennesse, florida)
  end

  defp _color(alabama, missisipi, georgia, tennesse, florida) do
    missisipi != tennesse and
      missisipi != alabama and
      alabama != tennesse and
      alabama != missisipi and
      alabama != georgia and
      alabama != florida and
      georgia != florida and
      georgia != tennesse
  end

  @doc """
  Returns the first valid coloring for the  map  of  the  southeastern United States
  """
  def color_first() do
    generate_all_colorings()
    |> Enum.reduce_while(
      [],
      &correct_coloring_helper/2
    )
  end

  @doc """
  Returns all valid colorings for the  map  of  the  southeastern United States
  """
  def color_all() do
    generate_all_colorings()
    |> Enum.filter(&correct_coloring_helper/1)
  end

  def show_coloring({alabama, missisipi, georgia, tennesse, florida}) do
    """
    Alabama = #{alabama}
    Missisipi = #{missisipi}
    Georgia = #{georgia}
    Tennesse =  #{tennesse}
    Florida =  #{florida}
    """
  end
end

IO.puts("Only the first valid coloring:")
for x <- MapColoring.color_first(), do: IO.puts(MapColoring.show_coloring(x))

IO.puts("All valid colorings:")
for x <- MapColoring.color_all(), do: IO.puts(MapColoring.show_coloring(x))
