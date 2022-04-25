defmodule NineNineElixirTest do
  use ExUnit.Case
  doctest NineNineElixir

  test "greets the world" do
    assert NineNineElixir.hello() == :world
  end

  test "day one test day01/0" do
    assert NineNineElixir.day01() == :d
  end
  
  test "day one test day01/1" do
    assert NineNineElixir.day01([:a, :b]) == :b
    assert NineNineElixir.day01([:a, :b, :c]) == :c
    assert NineNineElixir.day01([:a, [:n, :asdf], :c]) == :c
  end
end
