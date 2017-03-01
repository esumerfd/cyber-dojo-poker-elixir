defmodule DealerTest do
  use ExUnit.Case
  doctest Dealer

  test "five cards" do
    assert length(Dealer.deal) == 5
  end
end
