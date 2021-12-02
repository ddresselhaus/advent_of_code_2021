defmodule AdventOfCode2021.Solutions.Day01 do
  def process_input(input) do
    input
    |> String.split("\n")
    |> Enum.filter(fn x -> String.length(x) > 0 end)
    |> Enum.map(&String.to_integer/1)
  end

  def challenge_1(input) do
    input
    |> process_input()
    |> total_increases()
  end

  def challenge_2(input) do
    {final, acc} =
      input
      |> process_input()
      |> Enum.reduce({[], []}, fn x, {rolling, acc} ->
        cond do
          Enum.count(rolling) < 3 ->
            {[x | rolling], acc}

          true ->
            [a, b, _c] = rolling
            {[x, a, b], [Enum.sum(rolling) | acc]}
        end
      end)

    Enum.reverse([Enum.sum(final) | acc])
    |> total_increases()
  end

  def total_increases(input) do
    {_, acc} =
      Enum.reduce(input, {nil, []}, fn x, {previous, acc} ->
        case previous do
          nil ->
            {x, acc}

          _ ->
            case x > previous do
              true -> {x, [x | acc]}
              false -> {x, acc}
            end
        end
      end)

    Enum.count(acc)
  end
end
