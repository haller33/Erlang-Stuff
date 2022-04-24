
IO.puts(hand_fr.(File.read("error.txt")))
# = Error ao ler o arquivo. msg : enoent

"error.txt" |> File.read() |> hand_fr.() |> IO.puts()
# = Error ao ler o arquivo. msg : enoent


"error.txt" |> File.read() |> hand_fr.() |> IO.inspect(label: "result")
# = result: "Error ao ler o arquivo. msg : enoent"
# => "Error ao ler o arquivo. msg : enoent"

%{b: valor} = %{a: 1, b: 2, c: 3}
# => %{a: 1, b: 2, c: 3}
valor
# => 2


