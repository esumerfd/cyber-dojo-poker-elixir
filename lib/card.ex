defmodule Card do
  @moduledoc """
  A single card
  """

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
    face  = String.slice(card, 0, 1)
    suite = String.slice(card, 1, 1)

    [ parse_suite(suite), parse_face(face) ]
  end

  def parse_face(face) do
    find_key(@faces, face)
  end

  def parse_suite(suite) do
    find_key(@suites, suite)
  end

  defp find_key(collection, required_value) do
    found = Enum.find(collection, fn { _, value } -> value == required_value end)
    case found do
      nil -> ""
      _   -> elem(found, 0)
    end
  end
end

