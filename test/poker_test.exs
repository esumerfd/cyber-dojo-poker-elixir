defmodule PokerTest do
  use ExUnit.Case
  doctest Poker

  test "something" do
    assert 1 == 1
  end
end

defmodule DeckTest do
  use ExUnit.Case
  doctest Deck

  test "has four suits" do
    assert length(Deck.suits) == 4
  end

  test "has 13 faces" do
    assert length(Deck.faces) == 13
  end

  test "full deck" do
    assert length(Deck.cards) == 52
  end
end

defmodule HandTest do
  use ExUnit.Case
  doctest Hand

  test "card is two of hearts" do
    assert [ [Card.twoHearts] ] == Hand.parse("2H")
  end
end

defmodule CardTest do
  use ExUnit.Case
  doctest Card

  test "card is 2hearts" do
    assert "2H" == Card.twoHearts
  end
end

