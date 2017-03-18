defmodule Poker do
  @moduledoc """
  The game of Poker
  """

  def main(args) do
    IO.puts("Welcome to Poker: #{args}")

    {hand1, hand2, winner} = play()

    report(hand1, hand1 == winner)
    report(hand2, hand2 == winner)
  end

  def play do
    deck = Dealer.deck

    { hand1, deck } = Dealer.dealFiveCards(deck)
    { hand2, _ }    = Dealer.dealFiveCards(deck)

    { hand1, hand2, Hand.winner(hand1, hand2)}
  end

  defp report(hand, true),  do: IO.puts "#{Hand.format(hand)} WINNER"
  defp report(hand, false), do: IO.puts "#{Hand.format(hand)}"
end

