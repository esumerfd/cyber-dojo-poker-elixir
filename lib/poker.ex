defmodule Poker do
  def play do
    IO.puts("Poker")
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

