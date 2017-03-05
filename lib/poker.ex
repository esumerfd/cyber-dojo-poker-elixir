defmodule Poker do
  def main(args) do
    IO.puts("Welcome to Poker: #{args}")

    play
  end

  def play do
    deck = Dealer.deck

    { hand1, deck } = Dealer.deal(deck)
    { hand2, _ } = Dealer.deal(deck)

    IO.puts "Player One:"
    IO.inspect hand1
    IO.puts "Player Two:"
    IO.inspect hand2
  end
end

