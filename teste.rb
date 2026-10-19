# frozen_string_literal: true

require "debug"

# Client representation with name, optimus flag, value.
class Client
  attr_accessor :value, :test, :name
end

def calculate(num, num2, client)
  v = num + num2

  puts "Nil value!" if client.value.nil?

  return unless v.eql?(client.value)

  puts "Matching! Value - #{client.value}"
end

c = Client.new
c.value = 53
c.test = true
c.name = "Marco"

puts calculate(50, 2, c)
