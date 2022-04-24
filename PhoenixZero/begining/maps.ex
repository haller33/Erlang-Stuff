
%{"age" => 27, name: "eliseu"}
# => %{:name => "eliseu", "age" => 27}
n = %{"age" => 27, name: "eliseu"}
%{:name => "eliseu", "age" => 27}
n[:age]
# => nil
n["age"]
# => 27
n.name
# => "eliseu"
[nome: 5, age: 5]
# => [nome: 5, age: 5]


Map.values(Map.merge(person, adress))
# => ["CE", "Eliseu Lucena", "Rua sao damiao", 23]
