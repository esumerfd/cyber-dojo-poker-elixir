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

  test "cards are shuffled" do
    assert Deck.cards != Deck.cards
  end

  test "has all cards" do
    cards = Deck.cards

    assert [:heart, :ace] in cards
    assert [:heart, :two] in cards
    assert [:heart, :three] in cards
    assert [:heart, :four] in cards
    assert [:heart, :five] in cards
    assert [:heart, :six] in cards
    assert [:heart, :seven] in cards
    assert [:heart, :eight] in cards
    assert [:heart, :nine] in cards
    assert [:heart, :ten] in cards
    assert [:heart, :jack] in cards
    assert [:heart, :queen] in cards
    assert [:heart, :king] in cards

    assert [:diamond, :ace] in cards
    assert [:diamond, :two] in cards
    assert [:diamond, :three] in cards
    assert [:diamond, :four] in cards
    assert [:diamond, :five] in cards
    assert [:diamond, :six] in cards
    assert [:diamond, :seven] in cards
    assert [:diamond, :eight] in cards
    assert [:diamond, :nine] in cards
    assert [:diamond, :ten] in cards
    assert [:diamond, :jack] in cards
    assert [:diamond, :queen] in cards
    assert [:diamond, :king] in cards

    assert [:spade, :ace] in cards
    assert [:spade, :two] in cards
    assert [:spade, :three] in cards
    assert [:spade, :four] in cards
    assert [:spade, :five] in cards
    assert [:spade, :six] in cards
    assert [:spade, :seven] in cards
    assert [:spade, :eight] in cards
    assert [:spade, :nine] in cards
    assert [:spade, :ten] in cards
    assert [:spade, :jack] in cards
    assert [:spade, :queen] in cards
    assert [:spade, :king] in cards

    assert [:club, :ace] in cards
    assert [:club, :two] in cards
    assert [:club, :three] in cards
    assert [:club, :four] in cards
    assert [:club, :five] in cards
    assert [:club, :six] in cards
    assert [:club, :seven] in cards
    assert [:club, :eight] in cards
    assert [:club, :nine] in cards
    assert [:club, :ten] in cards
    assert [:club, :jack] in cards
    assert [:club, :queen] in cards
    assert [:club, :king] in cards
  end
end
