defmodule NineNineElixir do
  alias NineNineElixir.Tools, as: T

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
    T.my_last([:a, :b, :c, :d])
  end

  def day01(list) do
    T.my_last(list)
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
    T.my_but_last([:a, :b, :c, :d])
  end

  def day02(list) do
    T.my_but_last(list)
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
    T.element_at([:a, :b, :c, :d, :e], 3)
  end

  def day03(list, cnt) do
    T.element_at(list, cnt)
  end

  @doc """
    The Ninety-Nine Lisp Problems

    ## Working with lists

    P04 (*) Find the number of elements of a list.
  """
  def day04 do
    T.elements_length([:a, :b, :c, :d])
  end

  def day04(list) do
    T.elements_length(list)
  end

  @doc """
    The Ninety-Nine Lisp Problems

    ## Working with lists

    P05 (*) Reverse a list.
  """
  def day05 do
    T.reverse_list([:a, :b, :c, :d])
  end

  def day05(list) do
    T.reverse_list(list)
  end
end
