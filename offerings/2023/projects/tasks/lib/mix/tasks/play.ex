defmodule Mix.Tasks.Play do
  @moduledoc "The hello mix task: `mix help hello`"
  use Mix.Task

  @shortdoc "Simply calls the Tasks.play/0 function."
  def run(_) do
    # calling our Hello.say() function from earlier
    Tasks.play()
  end
end
