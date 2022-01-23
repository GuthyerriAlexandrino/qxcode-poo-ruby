# frozen_string_literal: true
require_relative 'item'

class VendingMachine
  attr_reader :cash, :profit

  def initialize(capacity)
    @slots = []
    @capacity = capacity
    @capacity.times { @slots << Item.new('Empty', 0, 0) }
    @profit = 0.0
    @cash = 0.0
  end

  #getter
  def [](index)
    raise 'Invalid index' unless index.positive? && index < @slots.size

    @slots[index]
  end

  #setter
  def []=(index, item)
    raise 'Invalid index' unless index >= 0 && index < @slots.size
    raise 'Variable int must be of type Item' unless item.instance_of?(Item)

    @slots[index] = item
  end

  def clear_slot(index)
    raise 'Invalid index' unless index >= 0 && index < @slots.size

    @slots[index].name = 'Empty'
    @slots[index].quantity = 0
    @slots[index].price = 0.0
  end

  def insert_cash(cash)
    @cash += cash unless cash.negative?
    nil
  end

  def withdraw_cash
    withdrawn = @cash
    @cash = 0
    withdrawn
  end

  def buy_item(index)
    raise 'Invalid index' unless index >= 0 && index < @slots.size
    raise 'Out of stock' if @slots[index].name == 'Empty'
    raise 'Insufficient money' if @cash < @slots[index].price
    
    @cash -= @slots[index].price
    @profit += @slots[index].price
    @slots[index]
  end

  def to_str
    str = "Saldo: R$#{@profit}\n"

    @slots.each_with_index { |sl, i| str += "#{i} #{sl}\n" }
    str
  end

end
