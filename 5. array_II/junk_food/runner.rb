# frozen_string_literal: true
require_relative 'vending_machine'
require_relative 'item'

vm = VendingMachine.new(10)
vm[0] = Item.new('Chocolate', 10, 10)
print vm.to_str
vm.insert_cash(15)
print vm.buy_item(0), "\n"
print vm.to_str
print vm.cash, "\n"
print vm.withdraw_cash, "\n"
print vm.cash
