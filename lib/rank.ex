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
  @moduledoc "Rand a poker hand"

  @face_ranks %{
    :ace_low  =>  "01",
    :two      =>  "02",
    :three    =>  "03",
    :four     =>  "04",
    :five     =>  "05",
    :six      =>  "06",
    :seven    =>  "07",
    :eight    =>  "08",
    :nine     =>  "09",
    :ten      =>  "10",
    :jack     =>  "11",
    :queen    =>  "12",
    :king     =>  "13",
    :ace      =>  "14",
  }

  def face_rank(face) do
    @face_ranks[face]
  end

  def weight(hand) do
    format_high_card(hand)
  end

  def format_high_card(hand) do
    format_rank(hand, "1")
  end

  def format_pair(hand) do
    format_rank(hand, "2")
  end

  def format_straight(hand) do
    format_rank(hand, "5")
  end

  defp format_rank(hand, rank_code) do
    Enum.map(hand, fn([_, face]) -> face_rank(face) end)
    |> Enum.sort(fn(face_rank1, face_rank2) -> face_rank1 > face_rank2 end)
    |> Enum.into(["#{rank_code},"])
    |> Enum.join
  end

  def format_four_of_a_kind(hand) do
    rank_code = "8"

    Enum.group_by(hand, fn [_, face] -> face end)
    |> Enum.sort(fn({_, cards1}, {_, cards2}) -> length(cards1) > length(cards2) end)
    |> Enum.map(fn({_, cards}) -> cards end)
    |> Enum.concat
    |> Enum.map(fn([_, face]) -> face_rank(face) end)
    |> Enum.into(["#{rank_code},"])
    |> Enum.join
  end
end
