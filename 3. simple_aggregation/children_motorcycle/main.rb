require_relative "motorcycle.rb"
require_relative "person.rb"

motinha = Motorcycle.new(10)
motinha.in(Person.new("Deavily", 6))
puts motinha
motinha.buy(10)
motinha.drive(10)
puts motinha.honk()