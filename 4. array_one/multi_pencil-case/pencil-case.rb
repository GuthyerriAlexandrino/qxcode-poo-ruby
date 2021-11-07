DIR = "../../3. simple_aggregation/pencil-case_graphite/"
require_relative DIR + "graphite.rb"
require_relative DIR + "pencil-case.rb"

class MultiPencilCase < PencilCase

    def initialize(caliber)
        @barrel = []
        @caliber = caliber
    end

    def insert(graphite)
        raise "O argumento tem que ser objeto de Graphite" unless graphite.instance_of? Graphite
        raise "O grafite tem calibre incompatível" unless graphite.caliber == @caliber
        @barrel.push(graphite) unless @graphite.nil?
        @graphite = graphite
    end

    def pull
        raise "O grafite tem que ser removido antes de outro ser inserido" unless @graphite.nil?
        unless @barrel.empty?
            @graphite = @barrel[0] 
            @barrel = @barrel.pop(@barrel.size - 1)
        end
    end

    def to_s
        "Calibre: #@caliber, Bico: #@graphite, Tambor: {" << @barrel.collect { |e| e }.join(" ") << "}"
    end
end

lapiseira = MultiPencilCase.new(0.5)
puts lapiseira
lapiseira.insert(Graphite.new(0.5, "HB", 50))
puts lapiseira
lapiseira.insert(Graphite.new(0.5, "2B", 50))
lapiseira.insert(Graphite.new(0.5, "4B", 50))
lapiseira.insert(Graphite.new(0.5, "6B", 50))
lapiseira.remove
lapiseira.pull
puts lapiseira