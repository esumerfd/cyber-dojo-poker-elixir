defmodule Hand do
  def parse(hand) do
    Regex.scan(~r/../, hand)
    |> Card.parse
  end
end

