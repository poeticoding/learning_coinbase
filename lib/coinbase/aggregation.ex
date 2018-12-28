defmodule Coinbase.Aggregation do
  use GenServer

  def start_link([]) do
    GenServer.start_link(__MODULE__, :ok, name: Coinbase.Aggregation)
  end

  def init(:ok), do: {:ok, %{}}

  def new_message(msg),
    do: new_message(Coinbase.Aggregation, msg)

  def new_message(pid, msg),
    do: GenServer.cast(pid, {:new_message, msg})

  def handle_cast({:new_message, %{"time" => time}}, %{}=counts) do
    {:ok, dt, _} = DateTime.from_iso8601(time)
    key = {dt.year, dt.month, dt.day, dt.hour, dt.minute, dt.second}
    updated_counts = Map.update(counts, key, 1, fn v-> v+1 end)
    {:noreply, updated_counts}
  end
end
