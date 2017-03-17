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
    Each face is a consecutive sequence.
    Input:  [[:heart, :seven], [:club, :seven], [:diamond, :two], [:spade, :seven], [:diamond, :three]]
  """
  def is_straight(hand) do
    faces = Enum.sort(hand, fn([_, face1], [_, face2]) -> Card.rank(face1) < Card.rank(face2) end)
    first = List.first faces
    last = List.last faces
    first_value = String.to_integer(Card.rank(first))
    last_value = String.to_integer(Card.rank(last))
    face_range = Enum.to_list first_value..last_value

    length(face_range) == 5
  end

  @doc """
    All cards must be of the same suit
    Input:  [[:heart, :seven], [:heart, :jack], [:heart, :two], [:heart, :eight], [:heart, :three]]
  """
  def is_flush(hand) do
    1 == Enum.group_by(hand, fn [suit, _] -> suit end) |> Map.size
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

