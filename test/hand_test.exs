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

  test "parsing a hand" do
    assert [[:spade, :ace]] == Hand.parse("AS")
    assert [[:spade, :ace], [:heart, :two], [:heart, :three], [:heart, :four], [:heart, :five]] == Hand.parse("AS 2H 3H 4H 5H")

    assert [ ["",""] ] == Hand.parse("")
  end

  test "high card" do
    #hand1 = Hand.parse("AS 2H 3H 4H 5H")
    #hand2 = Hand.parse("KS 2H 3H 4H 5H")

    #weight1 = Rank.weight(hand1)
    #weight2 = Rank.weight(hand2)

    #assert weight1 > weight2
  end
end

