# frozen_string_literal: true

# Class who implements passenger
class Passenger
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def priority?
    @age >= 70
  end

  def to_s
    "#{@name}:#{@age}"
  end
end
