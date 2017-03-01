defmodule Poker do
  def main(args) do
    IO.puts("Welcome to Poker: #{args}")
  end

  def play do
    IO.puts("Poker")
  end
end

defmodule Deck do
  def suits, do: [ :heart, :diamond, :spade, :club ]
  def faces do
    [ :ace,   :two,  :three, :four, :five, :six,
      :seven, :eight, :nine, :ten,  :jack, :queen, :king ]
  end
  def cards do
    for face <- faces, suit <- suits, do: {face, suit}    
  end
end

defmodule Hand do
  def parse(hand) do
    Regex.scan(~r/../, hand)
    |> Card.parse
  end
end

defmodule Card do
  def twoHearts, do: "2H"

  def parse(card) do
    card
  end
end

