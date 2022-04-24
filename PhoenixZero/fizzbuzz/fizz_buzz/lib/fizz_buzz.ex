defmodule FizzBuzz do

  def handle_file_split_inline({:ok, result}) do
    result
    |> String.replace("\n", "")
    |> String.split(",")
    # |> Enum.map(fn number -> String.to_integer(number) end)
    |> Enum.map(&String.to_integer/1) # simplify expression
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

  def build(file_name) do
    result = file_name |> File.read() |> handle_file_split_inline # handle_file
    
    IO.inspect(result)
  end
end
