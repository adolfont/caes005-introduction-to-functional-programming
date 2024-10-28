-- Declara um array de 10 posições
local array = {}

-- Coloca 0.1 no primeiro elemento
array[1] = 0.1

-- Preenche as posições subsequentes com 1.1 elevado ao valor anterior
for i = 2, 10 do
    array[i] = 1.1 ^ array[i - 1]
end

-- Lista todos os elementos e calcula a soma
local soma = 0
for i = 1, 10 do
    print("Elemento " .. i .. ": " .. array[i])
    soma = soma + array[i]
end

-- Exibe a soma total dos elementos
print("Soma de todos os elementos: " .. soma)


