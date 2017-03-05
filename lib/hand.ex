defmodule Hand do
  #def parse(hand) do
    #Regex.scan(~r/../, hand)
    #|> Card.parse
  #end

  def format(hand) do
    Enum.map(hand, fn(card) -> Card.format(card) end)
    |> Enum.join
  end
end

