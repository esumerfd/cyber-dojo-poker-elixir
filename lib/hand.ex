defmodule Hand do
  @moduledoc """
  A single poker hand of cards.
  """

  def format(hand) do
    Enum.map(hand, fn(card) -> Card.format(card) end)
    |> Enum.join(" ")
  end

  def parse(hand) do
    card_codes = String.split(hand, " ")
    Enum.map(card_codes, fn(card) -> Card.parse(card) end)
  end

  def winner(hand1, hand2) do
    rank1 = Rank.rank(hand1)
    rank2 = Rank.rank(hand2)

    cond do
      rank1 > rank2 -> hand1
      rank1 < rank2 -> hand2
      true          -> false
    end
  end

  #
  # Hand identification
  #
  #  Input:  [[:heart, :seven], [:club, :seven], [:diamond, :two], [:spade, :seven], [:diamond, :three]]
  #

  def is_high_card(_) do
    true
  end

  @doc "Pair: 2 of the 5 cards in the hand have the same value."
  def is_pair(hand) do
    Enum.group_by(hand, fn [_, face] -> face end)
    |> Enum.find(fn {_, cards} -> length(cards) == 2  end)
  end

  @doc "Two Pairs: The hand contains 2 different pairs."
  def is_two_pair(hand) do
    2 == Enum.group_by(hand, fn [_, face] -> face end)
    |> Enum.filter(fn {_, cards} -> length(cards) == 2  end)
    |> length
  end

  @doc "Three of a Kind: Three of the cards in the hand have the same value."
  def is_three_of_a_kind(hand) do
    Enum.group_by(hand, fn [_, face] -> face end)
    |> Enum.filter(fn {_, cards} -> length(cards) == 3 end)
    |> Enum.empty? == false
  end

  @doc "Straight: Hand contains 5 cards with consecutive values"
  def is_straight(hand) do
    is_straight_ace(&low_hi_cards_ace_low/1, hand) ||
      is_straight_ace(&low_hi_cards_ace_high/1, hand)
  end

  defp is_straight_ace(low_hi_func, hand) do
    {low, high} = low_hi_func.(hand)
    low_value = String.to_integer(Card.rank(low))
    high_value = String.to_integer(Card.rank(high))

    high_value - low_value == 4
  end

  @doc "Flush: Hand contains 5 cards of the same suit"
  def is_flush(hand) do
    1 == Enum.group_by(hand, fn [suit, _] -> suit end) |> Map.size
  end

  @doc "Full House: 3 cards of the same value, with the remaining 2 cards forming a pair."
  def is_full_house(hand) do
    face_group([2,3], hand)
  end

  @doc "Four of a kind: 4 cards with the same value"
  def is_four_of_a_kind(hand) do
    face_group([1,4], hand)
  end

  defp face_group(members, hand) do
    by_face = Enum.group_by(hand, fn [_, face] -> face end)

    Map.size(by_face) == 2 && 
      Enum.count(by_face, fn({_, cards}) -> Enum.member?(members, length(cards)) end) == 2
  end

  @doc "Straight flush: 5 cards of the same suit with consecutive values"
  def is_straight_flush(hand) do
    is_straight(hand) && is_flush(hand)
  end

  # This returns an :ace_low card which is non-standard
  # We happen to know htat it converts into a rank which is fine
  # however the "leaking" of this number into the wild feels bad.
  defp low_hi_cards_ace_low(hand) do
    Enum.map(hand, fn(card) -> 
      case card do
        [suit, :ace] -> [suit, :ace_low]
        _            -> card
      end
    end)
    |> low_hi_cards_ace_high
  end

  defp low_hi_cards_ace_high(hand) do
    cards = Enum.sort(hand, fn([_, face1], [_, face2]) -> Card.rank(face1) < Card.rank(face2) end)

    { (List.first cards), (List.last cards) }
  end
end

