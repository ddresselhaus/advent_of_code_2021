defmodule AdventOfCode2021.Solutions.Day02Test do
  use ExUnit.Case
  alias AdventOfCode2021.Solutions.Day02

  test "test 1" do
    input = File.read!("./lib/inputs/day02.txt")

    result = Day02.challenge_1(input)
    result_2 = Day02.challenge_2(input)
    assert result == 1882980
    assert result_2 == 1971232560
  end

  def test_input() do
    """
    forward 5
    down 5
    forward 8
    up 3
    down 8
    forward 2
    """
  end
end
