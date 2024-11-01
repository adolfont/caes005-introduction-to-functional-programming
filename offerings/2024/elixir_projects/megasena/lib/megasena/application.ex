defmodule MegaSena.Application do
  use Application

  def start(_type, _args) do
    # Start the supervisor
    numbers = 6
    guesses = 10
    result = MegaSena.Supervisor.start_link({numbers, guesses})

    # Start a game with a set number of tries
    MegaSena.main(100000)

    result
  end
end
