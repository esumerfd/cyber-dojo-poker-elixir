defmodule Dealer do
  #@moduledoc """
  #Represents a dealer managing the game.
  ### Examples
  #iex> deck = Dealer.deck
  #iex> { hand1, deck} = Dealer.deal deck
  #{[[:club, :four], [:spade, :two], [:club, :jack], [:diamond, :four], [:heart, :ten]],
  #iex> { hand2, deck} = Dealer.deal deck
  #{[[:diamond, :seven], [:diamond, :queen], [:heart, :four], [:club, :queen], [:club, :seven]],
  #"""
  
  @hand_size 5

  def hand_size, do: @hand_size

  def deck do
    Deck.cards
  end

  def deal(deck) do
    { Enum.slice(deck, 0..hand_size-1), Enum.slice(deck, hand_size..-1)  }
  end
end
