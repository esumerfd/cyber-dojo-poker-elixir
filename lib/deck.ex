defmodule Deck do
  @moduledoc """
  A full card deck that is shuffled.
  """

  def suits do
    Card.suits
  end

  def faces do
    Card.faces
  end

  def cards do
    shuffled_cards()
  end

  defp shuffled_cards do
    Enum.shuffle(standard_cards())
  end

  defp standard_cards do
    for suit <- suits(), face <- faces(), do: [suit, face]    
  end
end
