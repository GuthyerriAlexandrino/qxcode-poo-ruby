# frozen_string_literal: true

# Class necessary to playground
class Kid
  attr_reader :age, :name

  def initialize(age, name)
    raise 'Age must be of type Integer' unless age.instance_of? Integer
    raise 'Name must be a String' unless name.instance_of? String

    @age = age
    @name = name
  end

  def to_s
    "#{@name}:#{@age}"
  end
end
