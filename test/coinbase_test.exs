defmodule CoinbaseTest do
  use ExUnit.Case
  doctest Coinbase

  test "greets the world" do
    assert Coinbase.hello() == :world
  end
end
