defmodule DealerTest do
  use ExUnit.Case
  #doctest Dealer

  test "initial deck" do
    assert length(Dealer.deck) == 52
  end

  test "five cards" do
    { hand, _ } = Dealer.dealFiveCards(Deck.cards)

    assert length(hand) == 5
  end

  test "dealing cards reduces deck size" do
    full_deck = Deck.cards
    { _, partial_deck } = Dealer.dealFiveCards(full_deck)

    assert length(full_deck) - length(partial_deck) == 5
  end

  test "partial hands are returned if the deck is short" do
    { hand, deck } = Dealer.dealFiveCards([1,2,3,4])    
    assert length(hand) == 4
    assert length(deck) == 0

    { hand, deck } = Dealer.dealFiveCards([1])    
    assert length(hand) == 1
    assert length(deck) == 0

    { hand, deck } = Dealer.dealFiveCards([])    
    assert length(hand) == 0
    assert length(deck) == 0
  end

  test "five different cards" do
    deck = Deck.cards
    { hand1, deck } = Dealer.dealFiveCards(deck)
    { hand2, deck } = Dealer.dealFiveCards(deck)
    { hand3, deck } = Dealer.dealFiveCards(deck)
    { hand4, deck } = Dealer.dealFiveCards(deck)
    { hand5, deck } = Dealer.dealFiveCards(deck)
    { hand6, _ } = Dealer.dealFiveCards(deck)

    assert hand1 != hand2
    assert hand2 != hand3
    assert hand3 != hand4
    assert hand4 != hand5
    assert hand5 != hand6
  end
end
