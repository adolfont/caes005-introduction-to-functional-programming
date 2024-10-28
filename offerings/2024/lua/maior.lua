-- Solicita os três números ao usuário
print("Digite o primeiro número:")
local num1 = io.read("*n")

print("Digite o segundo número:")
local num2 = io.read("*n")

print("Digite o terceiro número:")
local num3 = io.read("*n")

-- Calcula o maior número
local maior = num1

if num2 > maior then
    maior = num2
end

if num3 > maior then
    maior = num3
end

-- Imprime o maior número
print("O maior número é:", maior)
