defmodule HandTest do
  use ExUnit.Case
  doctest Hand

  test "format hand as string" do
    hand = [ [:heart, :two], [:spade, :ace], [:club, :king], [:club, :two], [:diamond, :ten] ]

    assert "2H AS KC 2C TD" == Hand.format(hand)
  end

  test "format any number of cards" do
    hand = [ [:heart, :two], [:spade, :ace] ]

    assert "2H AS" == Hand.format(hand)
  end

  test "format empty string if there are no cards" do
    hand = []

    assert "" == Hand.format(hand)
  end
end

