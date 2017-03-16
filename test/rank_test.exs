defmodule RankTest do
  use ExUnit.Case
  doctest Rank

  test "card rank" do
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
  
  test "format rank for high card" do
    assert "1,1405040302" == Rank.format_high_card(Hand.parse("AS 2H 3H 4H 5H"))
    assert "1,0605040302" == Rank.format_high_card(Hand.parse("6S 2H 3H 4H 5H"))
    assert "1,0605040302" == Rank.format_high_card(Hand.parse("3H 2H 6S 4H 5H"))
  end

  test "format rank for a pair" do
    assert "2,0707040302" == Rank.format_pair(Hand.parse("7H 7C 2D 4C 3D"))
    assert "2,0707030202" == Rank.format_pair(Hand.parse("7H 2C 2D 7C 3D"))
  end

  test "format rank for two pair" do
    assert "3,0707060602" == Rank.format_two_pair(Hand.parse("7H 7C 2D 6C 6D"))
    assert "3,0707060603" == Rank.format_two_pair(Hand.parse("7H 6C 6D 7C 3D"))
  end

  test "format rank for three of a kind" do
    assert "4,0707070302" == Rank.format_three_of_a_kind(Hand.parse("7H 7C 2D 7S 3D"))
    assert "4,0707070908" == Rank.format_three_of_a_kind(Hand.parse("7H 8C 9D 7C 7D"))
    assert "4,0707070906" == Rank.format_three_of_a_kind(Hand.parse("7H 7C 9D 7S 6D"))
  end

  test "format rank for a straight" do
    assert "5,0807060504" == Rank.format_straight(Hand.parse("4D 5H 6S 7D 8H"))
    assert "5,0807060504" == Rank.format_straight(Hand.parse("8H 4D 6S 5H 7D"))
  end

  test "format rank a four of a kind" do
    assert "8,0404040402" == Rank.format_four_of_a_kind(Hand.parse("2H 4D 4H 4S 4C"))
    assert "8,0404040405" == Rank.format_four_of_a_kind(Hand.parse("5H 4D 4H 4S 4C"))
  end
end

