defmodule HandTest do
  use ExUnit.Case
  doctest Hand

  test "card is two of hearts" do
    assert [ [Card.twoHearts] ] == Hand.parse("2H")
  end
end

