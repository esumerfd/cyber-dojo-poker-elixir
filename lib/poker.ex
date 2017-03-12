defmodule Poker do
  @moduledoc """
  The game of Poker
  """

  def main(args) do
    IO.puts("Welcome to Poker: #{args}")

    play
  end

  def play do
    deck = Dealer.deck

    { hand1, deck } = Dealer.dealFiveCards(deck)
    { hand2, _ }    = Dealer.dealFiveCards(deck)

    IO.puts "Player One: #{Hand.format(hand1)}"
    IO.puts "Player Two: #{Hand.format(hand2)}"
  end
end

