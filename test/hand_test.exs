defmodule HandTest do
  use ExUnit.Case
  doctest Hand

  #test "card is two of hearts" do
    #assert [ [Card.twoHearts] ] == Hand.parse("2H")
  #end

  test "format hand as string" do
    hand = [ [:heart, :two] ]

    assert "2H" == Hand.format(hand)
  end
end

