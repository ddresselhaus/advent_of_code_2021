defmodule AdventOfCode2021.Solutions.Day02 do
  def process_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> String.split(x, " ") end)
    |> Enum.map(fn [direction, num] -> %{direction: direction, amount: String.to_integer(num)} end)
  end

  def challenge_1(input) do
    {x,y} = input
    |> process_input()
    |> Enum.reduce({0,0}, fn(%{amount: amount, direction: direction}, {x,y}) ->
      case direction do
        "forward" -> {x + amount, y}
        "down" -> {x, y + amount}
        "up" -> {x, y - amount}
      end
    end)
    x * y
  end

  def challenge_2(input) do
    {x,y, _aim} = input
    |> process_input()
    |> Enum.reduce({0,0,0}, fn(%{amount: amount, direction: direction}, {x, y, aim}) ->
      case direction do
        "forward" -> {x + amount, y + (aim * amount), aim}
        "down" -> {x, y, aim + amount}
        "up" -> {x, y, aim - amount}
      end
    end)
    x * y
  end
end
