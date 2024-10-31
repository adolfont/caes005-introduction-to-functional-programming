defmodule Megasena.Server do
  use GenServer

  # Client API
  def start_link(_args) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  # Server (GenServer) Callbacks

  # Called when the GenServer is first started
  def init(_) do
    six_numbers = 1..60 |> Enum.to_list() |> Enum.shuffle() |> Enum.take(6) |> Enum.sort()

    {:ok, six_numbers}
  end

  # Handles synchronous calls (e.g., GenServer.call/2)
  def handle_call({:play, guess}, _from, state) do
    state_set = MapSet.new(state)
    guess_set = MapSet.new(guess)

    correct_guesses =
      state_set
      |> MapSet.intersection(guess_set)
      |> Enum.count()

    {:reply, "You guessed #{correct_guesses} numbers!", state}
  end

  # # Handles asynchronous messages (e.g., GenServer.cast/2)
  # def handle_cast({:set_numbers, numbers}, _state) do
  #   # Here you would update the state with the given numbers
  #   {:noreply, numbers}
  # end

  # # Optional: Handle other messages
  # def handle_info(_msg, state) do
  #   {:noreply, state}
  # end
end
