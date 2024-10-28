-- Solicita os três números ao usuário
io.write("Digite o primeiro número: ")
local num1 = tonumber(io.read())

io.write("Digite o segundo número: ")
local num2 = tonumber(io.read())

io.write("Digite o terceiro número: ")
local num3 = tonumber(io.read())
-- Calcula o maior número
local maior = num1

if num2 > maior then
    maior = num2
end

if num3 > maior then
    maior = num3
end

-- Função para calcular o fatorial de um número
local function fatorial(n)
    local resultado = 1
    for i = 2, n do
        resultado = resultado * i
    end
    return resultado
end

-- Calcula o fatorial do maior número
local fatorial_maior = fatorial(maior)

-- Imprime o maior número e seu fatorial
print("O maior número é:", maior)
print("O fatorial de", maior, "é:", fatorial_maior)
