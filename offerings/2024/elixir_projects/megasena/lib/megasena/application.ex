defmodule MegaSena.Application do
  use Application

  def start(_type, _args) do
    # Start the supervisor
    numbers = 2
    guesses = 20
    result = MegaSena.Supervisor.start_link({numbers, guesses})

    # Start a game with a set number of tries
    MegaSena.main(100)

    result
  end
end
