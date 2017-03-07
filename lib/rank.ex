defmodule Rank do
  @moduledoc "Rand a poker hand"

  @face_values %{
    :ace_low  =>  "01",
    :two      =>  "02",
    :three    =>  "03",
    :four     =>  "04",
    :five     =>  "05",
    :six      =>  "06",
    :seven    =>  "07",
    :eight    =>  "08",
    :nine     =>  "09",
    :ten      =>  "10",
    :jack     =>  "11",
    :queen    =>  "12",
    :king     =>  "13",
    :ace      =>  "14",
  }

  def card_value(face) do
    @face_values[face]
  end

  def weight(hand) do
    high_card(hand)
  end

  def high_card(hand) do
    Enum.map(hand, fn([_, face]) -> card_value(face) end)
    |> Enum.sort(fn(card_value1, card_value2) -> card_value1 > card_value2 end)
    |> Enum.into(["1,"])
    |> Enum.join
  end
end
