defmodule NineNineElixir.Tools do
  def my_last([]), do: []

  def my_last(list) do
    case tl(list) do
      [] -> list
      _ -> my_last(tl(list))
    end
  end

  def my_but_last([]), do: []

  def my_but_last(list) do
    case tl(list) do
      [] -> list
      [_] -> list
      _ -> my_but_last(tl(list))
    end
  end

  def element_at([], _), do: []
  def element_at(lst, 1), do: hd(lst)

  def element_at(lst, cnt_item) do
    element_at(tl(lst), cnt_item - 1)
  end

  def elements_length([]), do: 0
  def elements_length(lst), do: elements_length(lst, 1)

  def elements_length(lst, acc) do
    case tl(lst) do
      [] -> acc
      _ -> elements_length(tl(lst), acc + 1)
    end
  end
end
