defmodule Coinbase.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Coinbase.Aggregation, []},
      {Coinbase.Client, ["BTC-USD", "BTC-EUR", "BTC-GBP",
          "ETH-USD", "ETH-EUR", "ETH-GBP",
          "LTC-USD", "LTC-EUR", "LTC-GBP",
          "BTC-USD"]
      }
    ]

    opts = [strategy: :one_for_one, name: Coinbase.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
