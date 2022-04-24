
x = 1

2 = x
# => ** (MatchError) no match of right hand side value: 1

1 = x
# => 1

[a, b, c] = [1, 2, 3]
# => [1, 2, 3]
a
# => 1
b
# => 2
c
# => 3

[a,b,5] = [1,2,5]
# => [1, 2, 5]

a,b,c = [1,2,3]
# => ** (SyntaxError) iex:12:2: syntax error before: ',' 

[ head | tail ] = [1,2,43,5,60]
# => [1, 2, 43, 5, 60]
head
# => 1
tail
# => [2, 43, 5, 60]
[ a, b | tail ] = [1,2,3,4,5]
# => [1, 2, 3, 4, 5]
a
# => 1
b
# => 2
tail
# => [3, 4, 5]

{:ok, result} = File.read("enums.ex")
# => {:ok, "Enum.map([3, 43, 54, 23, 65, 12, 20], fn x -> x + 1 end)\n# => [4, 44, 55, 24, 66, 13, 21]\nnumber = %{x: 1, y: "...}


hand_fr = fn
...> {:ok, result} -> result
...> {:error, msg} -> "Error ao ler o arquivo. msg : #{msg}"         
...> end

hand_fr.(File.read("error.txt"))
# => "Error ao ler o arquivo. msg : enoent"



