defmodule MegaSena.Server do
  use GenServer

  # Client API
  def start_link(numbers) do
    GenServer.start_link(__MODULE__, numbers, name: __MODULE__)
  end

  # Server (GenServer) Callbacks

  # Called when the GenServer is first started
  def init(numbers) do
    all_numbers = 1..60 |> Enum.shuffle() |> Enum.take(numbers) |> Enum.sort()

    dbg(all_numbers)

    {:ok, all_numbers}
  end

  def handle_call({:play, guess}, _from, state) do
    state_set = MapSet.new(state)
    guess_set = MapSet.new(guess)

    correct_guesses =
      state_set
      |> MapSet.intersection(guess_set)
      |> Enum.count()

    {:reply, correct_guesses, state}
  end

  def handle_call(:get_numbers, _from, state) do
    {:reply, state, state}
  end

  def get_numbers() do
    GenServer.call(__MODULE__, :get_numbers)
  end

  def guess_numbers(guess) do
    GenServer.call(__MODULE__, {:play, guess})
  end

  # Convenience function to start a new instance and inspect the numbers
  def new(numbers) do
    {:ok, pid} = MegaSena.Server.start_link(numbers)
    IO.inspect(MegaSena.Server.get_numbers(), label: "Generated numbers")
    pid
  end
end
