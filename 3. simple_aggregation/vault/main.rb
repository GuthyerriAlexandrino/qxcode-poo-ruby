require_relative "vault.rb"
require_relative "item.rb"
require_relative "coin.rb"

poico = Vault.new(10)
poico.add_coin(Coin.new(0.25))
poico.add_coin(Coin.new(0.5))
poico.add_item(Item.new("Lápis", 2))
poico.add_item(Item.new("Gabriel", 3))
puts poico
poico.break
poico.add_coin(Coin.new(0.5))
puts poico