function reduce (table, fun, start)
  local accum = start
  for i = 1, #table do
    accum = fun(accum, table[i])
  end
  return accum
end

function add(a, b)
    return a + b
end


function multiply(a, b)
    return a * b
end

my_table = {1, 3, 5, 4, 2}

for key, value in pairs(my_table) do
    print("my_table[".. key.. "] = ".. value)
end


print("Soma dos valores de my_table: ".. reduce(my_table, add, 0))

print("Produto dos valores de my_table: ".. reduce(my_table, multiply, 1))
