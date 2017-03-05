defmodule RankTest do
  use ExUnit.Case
  doctest Rank

  # Rank
  # 9 - straight flush + highest card
  # 8 - four of a kind + card value
  # 7 - full house + 3 card value
  # 6 - flush + highest cards
  # 5 - straight (can be ace high) + highest card
  # 4 - three of a kind + 3 card value
  # 3 - two pair + highest pairs + remaining card
  # 2 - pair + 2 card value + highest cards
  # 1 - high card + highest cards

  # Card rank
  # ace   - 14
  # king  - 13
  # queen - 12
  # jack  - 11
  # ten   - 10
  # 9     - 09
  # ...
  # 2     - 02

  # Rank Code
  # [ rank code, sorted faces ]
  # e.g.
  # - 1, 0504030201
  # - 1, 0605040302 WINNER
  # - 4, 0404040201
  # - 4, 0505050201 WINNER
  
  #test "rank a high card" do
    #assert "1,1402030405" == Rank.weight(Hand.parse("AS 2H 3H 4H 5H"))
  #end

  #test "rank a pair" do
    #assert "2,0707040302" == Rank.weight(Hand.parse("7H 7C 2D 4C 3D"))
  #end

  #test "rank a straight" do
    #assert "5,0807060504" == Rank.weight(Hand.parse("4D 5H 6S 7D 8H"))
  #end

  #test "rank a four of a kind - high card higest" do
    #assert "8,0404040402" == Rank.weight(Hand.parse("2H 4D 4H 4S 4C"))
  #end

  #test "rank a four of a kind - high card lowest" do
    #assert "8,0404040405" == Rank.weight(Hand.parse("5H 4D 4H 4S 4C"))
  #end
end

