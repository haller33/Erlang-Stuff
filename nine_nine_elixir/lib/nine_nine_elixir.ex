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

  defp my_last([]), do: []

  defp my_last(list) do
    case tl(list) do
      [] -> list
      _ -> my_last(tl(list))
    end
  end

  @doc """
  The Ninety-Nine Lisp Problems

  ## Working with lists

    P02 (*) Find the last but one box of a list.
    Example:
    * (my-but-last '(a b c d))
    (C D)

  """
  def day02 do
    my_but_last([:a, :b, :c, :d])
  end

  def day02(some_list) do
    my_but_last(some_list)
  end

  defp my_but_last([]), do: []

  defp my_but_last(list) do
    case tl(list) do
      [] -> list
      [_] -> list
      _ -> my_but_last(tl(list))
    end
  end

  @doc """
  The Ninety-Nine Lisp Problems

  ## Working with lists

    P03 (*) Find the K'th element of a list.
    The first element in the list is number 1.
    Example:
    * (element-at '(a b c d e) 3)
    C

  """
  def day03 do
    element_at([:a, :b, :c, :d, :e], 3)
  end

  def day03(some_list, cnt) do
    element_at(some_list, cnt)
  end

  defp element_at([], _), do: []
  defp element_at(lst, 1), do: hd(lst)

  defp element_at(lst, cnt_item) do
    element_at(tl(lst), cnt_item - 1)
  end
end
