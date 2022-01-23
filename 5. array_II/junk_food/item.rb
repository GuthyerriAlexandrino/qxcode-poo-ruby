# frozen_string_literal: true

class Item
  attr_accessor :name, :quantity, :price

  def initialize(name, quantity, price)
    @name = name
    @quantity = quantity.to_i
    @price = price.to_f
  end

  def to_s
    "[#{@name} : #{@quantity} : R$#{@price}]"
  end

end