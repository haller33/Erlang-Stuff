defmodule FizzBuzzTest do
  use ExUnit.Case
  # doctest FizzBuzz

  describe "build/1" do
    # when return pattern
    test "when a valid file is provided, return the converted list" do
      expected_response = {:ok, [1, 2, :fizz, 4, :buzz, 56, :fizz, :fizzbuzz, :buzz, :fizzbuzz]}
      assert FizzBuzz.build("numbers.txt") == expected_response
    end

    test "when a invalid file is provided, return a message error" do
      expected_response = {:error, "error read file: enoent"}
      assert FizzBuzz.build("numbers.txts") == expected_response
    end
  end
end
