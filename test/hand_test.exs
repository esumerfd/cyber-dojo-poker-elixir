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

  test "is high card" do
    assert Hand.is_high_card(Hand.parse("AS 2H 3H 4H 5H"))
    assert Hand.is_high_card(Hand.parse("6S 2H 3H 4H 5H"))
    assert Hand.is_high_card(Hand.parse("3H 2H 6S 4H 5H"))
  end

  test "is a pair" do
    assert Hand.is_pair(Hand.parse("7H 7C 2D 4C 3D"))
    assert Hand.is_pair(Hand.parse("7H 2C 2D 7C 3D"))

    assert !Hand.is_pair(Hand.parse("4D 5H 6S 7D 8H"))
  end

  test "is two pair" do
    assert Hand.is_two_pair(Hand.parse("7H 7C 2D 6C 6D"))
    assert Hand.is_two_pair(Hand.parse("7H 6C 6D 7C 3D"))

    assert !Hand.is_two_pair(Hand.parse("7H 2C 6D 7C 3D"))
  end

  test "is three of a kind" do
    assert Hand.is_three_of_a_kind(Hand.parse("7H 7C 2D 7S 3D"))
    assert Hand.is_three_of_a_kind(Hand.parse("7H 8C 9D 7C 7D"))
    assert Hand.is_three_of_a_kind(Hand.parse("7H 7C 9D 7S 6D"))
  end

  test "is a straight - ace high" do
    assert Hand.is_straight(Hand.parse("4D 5H 6S 7D 8H"))
    assert Hand.is_straight(Hand.parse("8H 4D 6S 5H 7D"))
    assert Hand.is_straight(Hand.parse("TH JD QS KH AD"))
    
    assert !Hand.is_straight(Hand.parse("JH 4D 6S 5H 7D"))
    assert !Hand.is_straight(Hand.parse("AH 2D KS 3C 4H"))
  end
  
  test "is a straight - ace low" do
    assert Hand.is_straight(Hand.parse("AH 2D 3S 4H 5D"))

    assert !Hand.is_straight(Hand.parse("AH 2D 8S 4H 5D"))
  end

  test "is a flush" do
    assert Hand.is_flush(Hand.parse("2D 5D JD 7D 3D"))
    assert Hand.is_flush(Hand.parse("2D 5D JD 7D 2D"))

    assert !Hand.is_flush(Hand.parse("2D 5H JD 7D 2D"))
    assert !Hand.is_flush(Hand.parse("2D 5D JD 7H 2D"))
    assert !Hand.is_flush(Hand.parse("2D 5D JD 7D 2C"))
  end

  test "is a full house" do
    assert Hand.is_full_house(Hand.parse("7D 7C 3H 7S 3D"))
    assert Hand.is_full_house(Hand.parse("8H 7D 8C 7S 7H"))
  end

  test "is four of a kind" do
    assert Hand.is_four_of_a_kind(Hand.parse("2H 4D 4H 4S 4C"))
    assert Hand.is_four_of_a_kind(Hand.parse("5H 4D 4H 4S 4C"))
  end

  test "is straight flush" do
    assert Hand.is_straight_flush(Hand.parse("4D 5H 6S 7D 8H"))
    assert Hand.is_straight_flush(Hand.parse("8H 4D 6S 5H 7D"))
  end

end


