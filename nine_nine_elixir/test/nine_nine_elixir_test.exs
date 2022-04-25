defmodule NineNineElixirTest do
  use ExUnit.Case
  doctest NineNineElixir

  test "greets the world" do
    assert NineNineElixir.hello() == :world
  end
end
