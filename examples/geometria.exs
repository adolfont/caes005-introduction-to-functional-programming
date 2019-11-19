defmodule Geometria do
  def pi do
    3.1415
  end

  def circunferencia(raio) do
    2 * pi() * raio
  end

  def area_circulo(raio) do
    pi() * raio * raio
  end

  def perimetro_quadrado(lado) do
    4 * lado
  end

  def area_quadrado(lado) do
    lado * lado
  end

  def perimetro_triangulo(lado1, lado2, lado3) do
    lado1 + lado2 + lado3
  end

  def area_triangulo(base, altura) do
    (base * altura) / 2
  end

end
