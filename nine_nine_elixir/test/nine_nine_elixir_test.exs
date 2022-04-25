defmodule NineNineElixirTest do
  use ExUnit.Case
  doctest NineNineElixir

  alias NineNineElixir, as: NNElixir

  test "greets the world" do
    assert NNElixir.hello() == :world
  end

  test "day one test day01/0" do
    assert NNElixir.day01() == [:d]
  end

  test "day one test day01/1" do
    assert NNElixir.day01([]) == []
    assert NNElixir.day01([:a]) == [:a]
    assert NNElixir.day01([:a, :b]) == [:b]
    assert NNElixir.day01([:a, :b, :c]) == [:c]
    assert NNElixir.day01([:a, [:n, :asdf], :c]) == [:c]
  end

  test "day one test day02/0" do
    assert NNElixir.day02() == [:c, :d]
  end

  test "day two test day02/1" do
    assert NNElixir.day02([]) == []
    assert NNElixir.day02([:a]) == [:a]
    assert NNElixir.day02([:a, :b]) == [:a, :b]
    assert NNElixir.day02([:a, :b, :c]) == [:b, :c]
    assert NNElixir.day02([:a, [:n, :asdf], :c]) == [[:n, :asdf], :c]
  end

  test "day three test day03/0" do
    assert NNElixir.day03() == :c
  end

  test "day two test day03/2" do
    assert NNElixir.day03([], 3) == []
    assert NNElixir.day03([], 0) == []
    assert NNElixir.day03([:b], 2) == []
    assert NNElixir.day03([:a], 1) == :a
    assert NNElixir.day03([:a, :b], 2) == :b
    assert NNElixir.day03([:a, :b, :c], 3) == :c
    assert NNElixir.day03([:a, [:n, :asdf], :c], 2) == [:n, :asdf]

    assert NNElixir.day03([:a, :b, :c, :d, :e], 2) == :b
  end

  test "day four test day04/0" do
    assert NNElixir.day04() == 4
  end

  test "day four test day04/1" do
    assert NNElixir.day04([]) == 0
    assert NNElixir.day04([:a]) == 1
    assert NNElixir.day04([:a, :b]) == 2
    assert NNElixir.day04([:a, :b, :c]) == 3
    assert NNElixir.day04([:a, [:n, :asdf], :c]) == 3
    assert NNElixir.day04([:a, [:n, :asdf], :c, :d, :e]) == 5
  end

  test "day five test day05/0" do
    assert NNElixir.day05() == [:d, :c, :b, :a]
  end

  test "day five test day05/1" do
    assert NNElixir.day05([]) == []
    assert NNElixir.day05([:a]) == [:a]
    assert NNElixir.day05([:a, :b]) == [:b, :a]
    assert NNElixir.day05([:a, :b, :c]) == [:c, :b, :a]
    assert NNElixir.day05([:a, [:n, :asdf], :c]) == [:c, [:n, :asdf], :a]
    assert NNElixir.day05([:a, [:n, :asdf], :c, :d, :e]) == [:e, :d, :c, [:n, :asdf], :a]
  end
end
