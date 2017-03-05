defmodule Deck do

  def suits do
    [:heart, :diamond, :spade, :club]
  end

  def faces do
    [:ace, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king]
  end

  def cards do
    shuffled_cards
  end

  defp shuffled_cards do
    Enum.shuffle(standard_cards)
  end

  defp standard_cards do
    for suit <- suits, face <- faces, do: [suit, face]    
  end
end
