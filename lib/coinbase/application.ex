defmodule Coinbase.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Coinbase.Client, ["BTC-USD"]}
    ]

    opts = [strategy: :one_for_one, name: Coinbase.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
