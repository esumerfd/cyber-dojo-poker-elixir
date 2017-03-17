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

  def is_high_card(hand) do
    true
  end

  def is_pair(hand) do
    true
  end

  def is_two_pair(hand) do
    true
  end

  def is_three_of_a_kind(hand) do
    true
  end

  @doc """
  Input:  [[:heart, :seven], [:club, :seven], [:diamond, :two], [:spade, :seven], [:diamond, :three]]
  """
  def is_straight(hand) do
    #faces = Enum.sort(hand, fn([_, face1], [_, face2]) -> face1 > face2 end)
    #first = List.first faces
    #last = List.last faces
    #face_range = Enum.to_List Card.rank(first)..Card.rank(last)

    #length(faces) == 5
    true
  end

  def is_flush(hand) do
    #n = Enum.group_by(hand, fn [suit, _] -> suit end)
    #|> length
    #n == 5
    true
  end

  def is_full_house(hand) do
    true
  end

  def is_four_of_a_kind(hand) do
    true
  end

  def is_straight_flush(hand) do
    true
  end
end

