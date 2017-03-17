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

  #
  # Hande identitication
  #
  #  Input:  [[:heart, :seven], [:club, :seven], [:diamond, :two], [:spade, :seven], [:diamond, :three]]
  #

  def is_high_card(_) do
    true
  end

  @doc """
    Pair: 2 of the 5 cards in the hand have the same value. 
  """
  def is_pair(hand) do
    Enum.group_by(hand, fn [_, face] -> face end)
    |> Enum.find(fn {_, cards} -> length(cards) == 2  end)
  end

  @doc """
    Two Pairs: The hand contains 2 different pairs. 
  """
  def is_two_pair(hand) do
    2 == Enum.group_by(hand, fn [_, face] -> face end)
    |> Enum.filter(fn {_, cards} -> length(cards) == 2  end)
    |> length
  end

  @doc """
    Three of a Kind: Three of the cards in the hand have the same value. 
  """
  def is_three_of_a_kind(hand) do
    Enum.group_by(hand, fn [_, face] -> face end)
    |> Enum.filter(fn {_, cards} -> length(cards) == 3  end)
  end

  @doc """
    Straight: Hand contains 5 cards with consecutive values.
  """
  def is_straight(hand) do
    {low, high} = low_hi_card(hand)
    low_value = String.to_integer(Card.rank(low))
    high_value = String.to_integer(Card.rank(high))
    face_range = Enum.to_list low_value..high_value

    length(face_range) == 5
  end

  @doc """
    Flush: Hand contains 5 cards of the same suit.
  """
  def is_flush(hand) do
    1 == Enum.group_by(hand, fn [suit, _] -> suit end) |> Map.size
  end

  @doc """
    Full House: 3 cards of the same value, with the remaining 2 cards forming a pair. 
  """
  def is_full_house(_) do
    true
  end

  @doc """
    Four of a kind: 4 cards with the same value.
  """
  def is_four_of_a_kind(_) do
    true
  end

  @doc """
    Straight flush: 5 cards of the same suit with consecutive values.
  """
  def is_straight_flush(_) do
    true
  end

  defp low_hi_card(hand) do
    faces = Enum.sort(hand, fn([_, face1], [_, face2]) -> Card.rank(face1) < Card.rank(face2) end)
    { (List.first faces), (List.last faces) }
  end
end

