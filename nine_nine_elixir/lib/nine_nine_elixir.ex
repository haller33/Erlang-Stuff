defmodule NineNineElixir do
  @moduledoc """
  Documentation for `NineNineElixir`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> NineNineElixir.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  The Ninety-Nine Lisp Problems

  ## Working with lists

   P01 (*) Find the last box of a list.
   Example:
   * (my-last '(a b c d))
   (D)

  """
  def day01 do
    my_last([:a, :b, :c, :d])
  end

  def day01(some_list) do
    my_last(some_list)
  end

  defp my_last(list) do
    case tl(list) do
      [] -> hd(list)
      _  -> my_last(tl(list))
    end
  end
end
