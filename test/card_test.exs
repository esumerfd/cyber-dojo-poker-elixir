defmodule CardTest do
  use ExUnit.Case
  doctest Card

  test "formatted suit" do
    assert "H" == Card.format_suit(:heart)
    assert "D" == Card.format_suit(:diamond)
    assert "S" == Card.format_suit(:spade)
    assert "C" == Card.format_suit(:club)
  end

  test "formatted face" do
    assert "A" == Card.format_face(:ace)
    assert "2" == Card.format_face(:two)
    assert "3" == Card.format_face(:three)
    assert "4" == Card.format_face(:four)
    assert "5" == Card.format_face(:five)
    assert "6" == Card.format_face(:six)
    assert "7" == Card.format_face(:seven)
    assert "8" == Card.format_face(:eight)
    assert "9" == Card.format_face(:nine)
    assert "T" == Card.format_face(:ten)
    assert "J" == Card.format_face(:jack)
    assert "Q" == Card.format_face(:queen)
    assert "K" == Card.format_face(:king)
  end

  test "format card value" do
    assert "AS" == Card.format([:spade, :ace])
    assert "2H" == Card.format([:heart, :two])
  end

  test "parse card from string representation" do
    assert [:spade, :ace] == Card.parse("AS")
    assert [:heart, :ten] == Card.parse("TH")
    assert [:diamond, :eight] == Card.parse("8D")

    assert ["", ""] == Card.parse("")
  end
end

