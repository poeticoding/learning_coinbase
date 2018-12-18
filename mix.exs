defmodule Coinbase.MixProject do
  use Mix.Project

  def project do
    [
      app: :coinbase,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Coinbase.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:websockex, "~> 0.4.2"},
      {:poison, "~> 4.0"},
    ]
  end
end
