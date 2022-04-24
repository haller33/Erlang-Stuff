defmodule FizzBuzz do
  use Witchcraft

  defp handle_file_split_inline({:ok, result}) do
    result =
      result
      |> String.replace("\n", "")
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
      |> Enum.map(&evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_split_inline({:error, reason}), do: {:error, "error read file: #{reason}"}

  # using Guards
  defp evaluate_numbers(num) when rem(num, 5) == 0 and rem(num, 3) == 0, do: :fizzbuzz
  defp evaluate_numbers(num) when rem(num, 3) == 0, do: :fizz
  defp evaluate_numbers(num) when rem(num, 5) == 0, do: :buzz
  defp evaluate_numbers(num), do: num

  def build(file_name) do
    result =
      file_name
      |> File.read()
      # handle_file
      |> handle_file_split_inline

    IO.inspect(result)
  end
end
