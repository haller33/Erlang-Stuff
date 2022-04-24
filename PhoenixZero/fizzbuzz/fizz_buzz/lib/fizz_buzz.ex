defmodule FizzBuzz do
  
  use Witchcraft

  def handle_file_split_inline({:ok, result}) do
    result
    |> String.replace("\n", "")
    |> String.split(",")
    # |> Enum.map(fn number -> String.to_integer(number) end)
    # simplify expression
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&convert_and_eval_numbers/1)

    # "1,2,3,4" => ["1","2","3","4"]
  end

  def handle_file_split_inline({:error, reason}), do: "error read file: #{reason}"

  def handle_file_read_inline({:ok, result}), do: result
  def handle_file_read_inline({:error, reason}), do: reason

  def handle_file(file_result) do
    case file_result do
      {:ok, result} -> result
      {:error, reason} -> reason
    end
  end

  # using Guards
  def evaluate_numbers(num) when rem(num, 5) == 0 and rem(num, 3) == 0, do: :fizzbuzz
  def evaluate_numbers(num) when rem(num, 3) == 0, do: :fizz
  def evaluate_numbers(num) when rem(num, 5) == 0, do: :buzz
  def evaluate_numbers(num), do: num

  def convert_and_eval_numbers(element) do
    element
    |> evaluate_numbers()

    # if rem(number, 3) == 0 do
    #   :fizz
    # else if (rem(number, 5) == 0) do
    #   :buzz
    # end
    # end

    # case rem(number, 3) do
    #   0 -> :fizz
    #   _ -> number
    # end

    # case rem(number, 5) do
    #   0 -> :buzz
    #   _ -> number
    # end
  end

  def build(file_name) do
    result =
      file_name
      |> File.read()
      # handle_file
      |> handle_file_split_inline

    IO.inspect(result)
  end
end
