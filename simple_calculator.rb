# frozen_string_literal: true

require 'debug'

# Calc error class
class CalculatorErrorHandler < StandardError

end

print "Primeiro número: "
num1 = gets.chomp

print "Método para cálculo: "
calc_method = gets.chomp

print "Segundo número: "
num2 = gets.chomp

if calc_method.nil?
  raise CalculatorErrorHandler, "Método de cálculo inválido"
end


def calcular(num1, calc_method, num2)
  valid_calc_methods = {
    div: "/",
    mult: "*",
    mais: "+",
    menos: "-",
  }

  unless valid_calc_methods.value?(calc_method)
    raise CalculatorErrorHandler, "Método de cálculo inválido."
  end

  unless num1.match?(/\A-?\d+\z/) && num2.match?(/\A-?\d+\z/)
    raise CalculatorErrorHandler, "Os valores precisam ser números."
  end

  num1 = Integer(num1)
  num2 = Integer(num2)

  if num2.eql?(0) && calc_method.eql?("/")
    raise CalculatorErrorHandler, "Não é possível dividir por 0."
  end

  case calc_method
  when "*"
    num1 * num2
  when "/"
    num1 / num2
  when "+"
    num1 + num2
  when "-"
    num1 - num2
  else
    raise CalculatorErrorHandler, "Erro ao tentar executar cálculo."
end
end


unless calc_method.nil?
  begin
    v = calcular(num1, calc_method, num2)
    puts "Retorno: #{v}"

  rescue CalculatorErrorHandler => e
    puts "Falha ao cálcular. #{e.message}"

  rescue StandardError => e
    puts "Generic failure: #{e.message}"
  end
  end

## Importante, só nil e false são falsos. 0, [] e "" são truthy.