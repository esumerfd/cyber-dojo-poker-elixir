defmodule DealerTest do
  use ExUnit.Case
  doctest Dealer

  test "initial deck" do
    assert length(Dealer.deck) == 52
  end

  test "five cards" do
    { hand, _ } = Dealer.deal(Deck.cards)

    assert length(hand) == 5
  end

  test "dealing cards reduces deck size" do
    full_deck = Deck.cards
    { _, partial_deck } = Dealer.deal(full_deck)

    assert length(full_deck) - length(partial_deck) == Dealer.hand_size
  end

  test "partial hands are returned if the deck is short" do
    { hand, deck } = Dealer.deal([1,2,3,4])    
    assert length(hand) == 4
    assert length(deck) == 0

    { hand, deck } = Dealer.deal([1])    
    assert length(hand) == 1
    assert length(deck) == 0

    { hand, deck } = Dealer.deal([])    
    assert length(hand) == 0
    assert length(deck) == 0
  end

  test "five different cards" do
    deck = Deck.cards
    { hand1, deck } = Dealer.deal(deck)
    { hand2, _ } = Dealer.deal(deck)

    assert hand1 != hand2
  end
end
