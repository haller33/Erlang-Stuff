Enum.map([3, 43, 54, 23, 65, 12, 20], fn x -> x + 1 end)
# => [4, 44, 55, 24, 66, 13, 21]
number = %{x: 1, y: 2, z: 3}
# => %{x: 1, y: 2, z: 3}
number = [x: 1, y: 2, z: 3]
# => [x: 1, y: 2, z: 3]
Enum.map(number, fn {k, v} -> {k, -v} end)
# => [x: -1, y: -2, z: -3]
Enum.map(number, fn {k, v} -> {k, -v - 3} end)
# => [x: -4, y: -5, z: -6]
Enum.map(number, fn {k, v} -> {k, (-v - 3) - 3 } end)
# => [x: -7, y: -8, z: -9]
Enum.map(number, fn {k, v} -> {k, (-v - 3) + 4 } end)
# => [x: 0, y: -1, z: -2]
