defmodule AdventOfCode2021.Solutions.Day01Test do
  use ExUnit.Case
  alias AdventOfCode2021.Solutions.Day01

  test "test 1" do
    _test_input = """
    199
    200
    208
    210
    200
    207
    240
    269
    260
    263
    """
    input = File.read!("./lib/inputs/day01.txt")


    result = Day01.challenge_1(input)
    result2 = Day01.challenge_2(input)
    assert result == 1226
    assert result2 == 1252
  end
end
