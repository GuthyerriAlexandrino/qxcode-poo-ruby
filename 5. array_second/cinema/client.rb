# frozen_string_literal: true

# Class who implements theather client
class Client
  attr_accessor :name, :fone

  def initialize(name, phone)
    @name = name 
    @phone = phone
  end

  def to_s
    "#{@name}:#{@phone}"
  end
end
