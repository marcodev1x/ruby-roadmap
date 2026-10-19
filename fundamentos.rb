# frozen_string_literal: true
require "bigdecimal"

# Tudo é objeto: 5.times, nil.to_a, true.class. Não existem tipos primitivos "crus".

x = 5
s = nil

puts x.nil? ## F
puts s.nil? ## T
puts true.class


# Tipagem dinâmica e forte: variáveis não têm tipo, valores têm. "1" + 1 lança TypeError (não há conversão implícita como em JS).

x = 5
f = "12"

# puts x + f

# Tudo é expressão: if, case e métodos retornam valor; a última expressão é o retorno.

def will_return()
  1
end

unless 1.nil?
  puts 2 # puts 2
end

value_testable = 11

case value_testable
when 10
  puts "ok"
else
  puts "else necessário"
end

puts will_return # 1

# Nomes: snake_case para métodos e variáveis, CamelCase para classes e módulos, SCREAMING_SNAKE_CASE para constantes.
variable_tester = "teste"

class TestableClass
  attr_accessor :test
end

t = TestableClass.new

numv = 10.freeze # Freeze seta como constant.

puts numv

x = 10

def metodo
  x            # NameError! def NÃO enxerga variáveis locais de fora
end

[1, 2].each do |n|
  x += n       # blocks ENXERGAM e alteram variáveis externas (closure)
end
x # => 13

if true
  y = 1        # if/while/case NÃO criam escopo
end
y # => 1

if false
  z = 1
end
z # => nil (o parser viu a atribuição, então z existe e vale nil)

# Tipos de dados

# Integer
a, b, c, d = 42, 1_000_000, 0xff, 0b1010

puts a
puts b
puts c
puts d

# Float
e, f = 3.14, 1e-3
puts e
puts f

# BigDecimal (geralmente para $ sem ser cents)
ab = BigDecimal("0.1")
puts ab

# Nil. Nil, com class nil.
ac = nil

# True/false (bool)
abc = true
acd = false
puts abc
puts acd

# Symbol. Geralmente pra MAP

z = :ativo
puts z

# Array
arr = [1, "ABC", :array, [1, "ABC"], {}]

if arr.respond_to?("each")
  arr.each do |n|
    puts n
  end
end

# Hash (o map do Go, O(1) se indexado como no go!)
hash = { nome: "Ana" }
hash["model"] = "123"
puts hash

puts arr

# Set o(1)
set = Set[123, 456, 789]
set.add(000) # add
set.delete(123) # del
set.include?(456) # validate
set.empty? # verify if set is empty
set.size # size of set

puts set