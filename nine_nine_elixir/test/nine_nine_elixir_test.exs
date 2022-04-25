defmodule NineNineElixirTest do
  use ExUnit.Case
  doctest NineNineElixir

  test "greets the world" do
    assert NineNineElixir.hello() == :world
  end

  test "day one test day01/0" do
    assert NineNineElixir.day01() == [:d]
  end
  
  test "day one test day01/1" do
    assert NineNineElixir.day01([:a, :b]) == [:b]
    assert NineNineElixir.day01([:a, :b, :c]) == [:c]
    assert NineNineElixir.day01([:a, [:n, :asdf], :c]) == [:c]
  end

  test "day one test day02/0" do
    assert NineNineElixir.day02() == [:c, :d]
  end
  
  test "day two test day02/1" do
    assert NineNineElixir.day02([]) == []
    assert NineNineElixir.day02([:a]) == [:a]
    assert NineNineElixir.day02([:a, :b]) == [:a, :b]
    assert NineNineElixir.day02([:a, :b, :c]) == [:b,:c]
    assert NineNineElixir.day02([:a, [:n, :asdf], :c]) == [[:n, :asdf], :c]
  end
end
