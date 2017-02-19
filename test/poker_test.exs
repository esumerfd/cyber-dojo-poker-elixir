defmodule PokerTest do
  use ExUnit.Case
  doctest Poker

  test "something" do
    assert 1 == 1
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

