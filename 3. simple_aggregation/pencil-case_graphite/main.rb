require_relative "graphite.rb"
require_relative "pencil-case.rb"

lapiseira = PencilCase.new(0.7)
puts lapiseira.insert(Graphite.new(0.7, "4B", 14))
puts lapiseira.write
puts lapiseira
lapiseira.remove
puts lapiseira
lapiseira.insert(Graphite.new(0.7, "4B", 16))
lapiseira.write
puts lapiseira
puts lapiseira.write