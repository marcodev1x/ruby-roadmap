# frozen_string_literal: true

class CalculadoraError < StandardError; end

OPERACOES = {
  "+" => ->(a, b) { a + b },
  "-" => ->(a, b) { a - b },
  "*" => ->(a, b) { a * b },
  "/" => ->(a, b) { a / b },
}.freeze

def ler_numero(texto)
  Integer(texto, 10)
rescue ArgumentError
  raise CalculadoraError, "\"#{texto}\" não é um número inteiro."
end

def calcular(num1, operador, num2)
  operacao = OPERACOES.fetch(operador) do
    raise CalculadoraError, "Operador inválido. Use um destes: #{OPERACOES.keys.join(' ')}"
  end
  a = ler_numero(num1)
  b = ler_numero(num2)
  raise CalculadoraError, "Não é possível dividir por 0." if operador == "/" && b.zero?

  operacao.call(a, b)
end

def perguntar(texto)
  print texto
  entrada = gets
  exit if entrada.nil?
  entrada.strip
end

loop do
  num1 = perguntar("Primeiro número (ou \"sair\"): ")
  break if num1 == "sair"

  operador = perguntar("Operador (+ - * /): ")
  num2 = perguntar("Segundo número: ")

  puts "Resultado: #{calcular(num1, operador, num2)}"
rescue CalculadoraError => e
  puts "Erro: #{e.message}"
end