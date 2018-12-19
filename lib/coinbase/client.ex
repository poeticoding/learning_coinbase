defmodule Coinbase.Client do
  use WebSockex

  @url "wss://ws-feed.pro.coinbase.com"

  def start_link(products \\ []) do
    {:ok, pid} = WebSockex.start_link(@url, __MODULE__, :no_state)
    subscribe(pid, products)
    {:ok, pid}
  end

  def handle_connect(_conn, state) do
    IO.puts("connected!")
    {:ok, state}
  end

  def handle_disconnect(_conn, state) do
    IO.puts("disconnected")
    {:ok, state}
  end

  def handle_frame({:text, msg}, state) do
    handle_msg(Poison.decode!(msg), state)
  end

  def handle_msg(%{"type" => "match"} = trade, state) do
    IO.inspect(trade)
    {:ok, state}
  end

  def handle_msg(_, state), do: {:ok, state}

  def subscribe(pid, products) do
    frame = subscription_frame(products)
    WebSockex.send_frame(pid, frame)
  end

  defp subscription_frame(products) do
    subscription_json =
      %{
        type: "subscribe",
        product_ids: products,
        channels: ["matches"]
      }
      |> Poison.encode!()

    {:text, subscription_json}
  end
end
