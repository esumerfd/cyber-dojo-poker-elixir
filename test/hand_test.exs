defmodule HandTest do
  use ExUnit.Case
  doctest Hand

  #test "card is two of hearts" do
    #assert [ [Card.twoHearts] ] == Hand.parse("2H")
  #end

  test "format hand as string" do
    hand = [ [:heart, :two], [:spade, :ace], [:club, :king], [:club, :two], [:diamond, :ten] ]

    assert "2HASKC2CTD" == Hand.format(hand)
  end
end

