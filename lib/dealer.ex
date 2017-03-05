defmodule Dealer do
  @hand_size 5

  def hand_size, do: @hand_size

  def deck do
    Deck.cards
  end

  def deal(deck) do
    { Enum.slice(deck, 0..hand_size-1), Enum.slice(deck, hand_size..-1)  }
  end
end
