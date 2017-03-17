# Rank Encoding
#
# Rank for Hands
# 9 - straight flush + highest card
# 8 - four of a kind + card value
# 7 - full house + 3 card value
# 6 - flush + highest cards
# 5 - straight (can be ace high) + highest card
# 4 - three of a kind + 3 card value
# 3 - two pair + highest pairs + remaining card
# 2 - pair + 2 card value + highest cards
# 1 - high card + highest cards
#
# Face Value Rank
# ace   - 14
# king  - 13
# queen - 12
# jack  - 11
# ten   - 10
# 9     - 09
# ...
# 2     - 02
# ace   - 01
#
# Rank Code
# [ rank code, sorted faces ]
# e.g.
# - 1, 0504030201
# - 1, 0605040302 WINNER
# - 4, 0404040201
# - 4, 0505050201 WINNER
defmodule Rank do
  @moduledoc "Rank a poker hand"

  @doc """
  Format methods:
  Input:  [[:heart, :seven], [:club, :seven], [:diamond, :two], [:spade, :seven], [:diamond, :three]]
  Output: "4,0707070302"
  """

  def format_high_card(hand) do
    sort_by_face(hand, "1")
  end

  def format_pair(hand) do
    sort_by_face(hand, "2")
  end

  def format_two_pair(hand) do
    sort_by_face(hand, "3")
  end

  def format_three_of_a_kind(hand) do
    sort_by_repeat(hand, "4")
  end

  def format_straight(hand) do
    sort_by_face(hand, "5")
  end

  def format_flush(hand) do
    sort_by_face(hand, "6")
  end

  def format_full_house(hand) do
    sort_by_repeat(hand, "7")
  end

  def format_four_of_a_kind(hand) do
    sort_by_repeat(hand, "8")
  end

  def format_straight_flush(hand) do
    sort_by_repeat(hand, "9")
  end

  defp sort_by_face(hand, rank_code) do
    Enum.map(hand, fn(card) -> Card.rank(card) end)
    |> Enum.sort(fn(face_rank1, face_rank2) -> face_rank1 > face_rank2 end)
    |> format_rank(rank_code)
  end

  defp sort_by_repeat(hand, rank_code) do
    Enum.group_by(hand, fn [_, face] -> face end)
    |> Enum.sort(fn({face1, cards1}, {face2, cards2}) -> 
      "#{length(cards1)}|#{Card.rank(face1)}" > "#{length(cards2)}|#{Card.rank(face2)}"
    end)
    |> Enum.map(fn({_, cards}) -> cards end)
    |> Enum.concat
    |> Enum.map(fn(card) -> Card.rank(card) end)
    |> format_rank(rank_code)
  end

  defp format_rank(hand, rank_code) do
     Enum.into(hand, ["#{rank_code},"])
    |> Enum.join
  end
end
