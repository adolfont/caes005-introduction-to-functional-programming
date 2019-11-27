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

  [First version](https://github.com/adolfont/introducao-a-programacao-funcional/blob/9f92ce102b85088a58e941b468892e0e929617a5/examples/map_coloring.exs)



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

  defp _valid_coloring_accumulator(true, coloring, accumulator) do
    {:halt, accumulator ++ [coloring]}
  end

  defp _valid_coloring_accumulator(false, _, accumulator) do
    {:cont, accumulator}
  end

  defp valid_coloring_accumulator(
         {alabama, missisipi, georgia, tennesse, florida} = coloring,
         accumulator
       ) do
    _valid_coloring_accumulator(
      valid_coloring?(alabama, missisipi, georgia, tennesse, florida),
      coloring,
      accumulator
    )
  end

  defp valid_coloring_filter(coloring) do
    {alabama, missisipi, georgia, tennesse, florida} = coloring

    valid_coloring?(alabama, missisipi, georgia, tennesse, florida)
  end

  defp valid_coloring?(alabama, missisipi, georgia, tennesse, florida) do
    missisipi != tennesse and
      missisipi != alabama and
      alabama != tennesse and
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
    |> find_first_valid_coloring()
  end

  defp find_first_valid_coloring(colorings) do
    Enum.reduce_while(
      colorings,
      [],
      &valid_coloring_accumulator/2
    )
    |> Enum.at(0)
  end

  @doc """
  Returns all valid colorings for the  map  of  the  southeastern United States
  """
  def color_all() do
    generate_all_colorings()
    |> filter_valid_colorings()
  end

  defp filter_valid_colorings(colorings) do
    Enum.filter(colorings, &valid_coloring_filter/1)
  end

  @doc """
  Shows a map coloring as a string.
  """
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
