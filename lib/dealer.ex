defmodule Dealer do
  @moduledoc """
  Represents a dealer managing the game.
  ## Examples
  iex> deck = Dealer.deck
  iex> { hand1, deck} = Dealer.deal deck
  {[[:club, :four], [:spade, :two], [:club, :jack], [:diamond, :four], [:heart, :ten]],
  iex> { hand2, deck} = Dealer.deal deck
  {[[:diamond, :seven], [:diamond, :queen], [:heart, :four], [:club, :queen], [:club, :seven]],
  """
  
  def deck do
    Deck.cards
  end

  def dealFiveCards(deck) do
    hand_size = 5
    { Enum.take(deck, hand_size), Enum.drop(deck, hand_size)  }
  end
end
