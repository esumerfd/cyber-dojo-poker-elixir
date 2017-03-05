defmodule CardTest do
  use ExUnit.Case
  doctest Card

  test "card is 2hearts" do
    assert "2H" == Card.format([:heart, :two])
  end
end

