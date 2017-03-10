defmodule RankTest do
  use ExUnit.Case
  doctest Rank

  test "card weight" do
    assert "01" == Rank.face_rank(:ace_low)
    assert "02" == Rank.face_rank(:two)
    assert "03" == Rank.face_rank(:three)
    assert "04" == Rank.face_rank(:four)
    assert "05" == Rank.face_rank(:five)
    assert "06" == Rank.face_rank(:six)
    assert "07" == Rank.face_rank(:seven)
    assert "08" == Rank.face_rank(:eight)
    assert "09" == Rank.face_rank(:nine)
    assert "10" == Rank.face_rank(:ten)
    assert "11" == Rank.face_rank(:jack)
    assert "12" == Rank.face_rank(:queen)
    assert "13" == Rank.face_rank(:king)
    assert "14" == Rank.face_rank(:ace)
  end
  
  test "rank a high card" do
    assert "1,1405040302" == Rank.weight(Hand.parse("AS 2H 3H 4H 5H"))
    assert "1,0605040302" == Rank.weight(Hand.parse("6S 2H 3H 4H 5H"))
  end

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

