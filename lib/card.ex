defmodule Card do
  @suites %{
    :heart    =>  "H",
    :diamond  =>  "D",
    :spade    =>  "S",
    :club     =>  "C"
 }

 @faces %{
   :ace    =>  "A",
   :two    =>  "2",
   :three  =>  "3",
   :four   =>  "4",
   :five   =>  "5",
   :six    =>  "6",
   :seven  =>  "7",
   :eight  =>  "8",
   :nine   =>  "9",
   :ten    =>  "T",
   :jack   =>  "J",
   :queen  =>  "Q",
   :king   =>  "K"
 }

  def suites do
    Map.keys(@suites)
  end

  def faces do
    Map.keys(@faces)
  end

  def format_suite(suit) do
    @suites[suit]
  end

  def format_face(face) do
    @faces[face]
  end

  def format(card) do
    [suite, face] = card
    "#{format_face(face)}#{format_suite(suite)}"
  end

  def parse(card) do
    card
  end
end

