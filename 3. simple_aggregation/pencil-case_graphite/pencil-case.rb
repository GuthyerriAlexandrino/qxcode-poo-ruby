class PencilCase
    
    def initialize(caliber)
        @caliber = caliber
        @graphite = nil
    end

    def insert(graphite)
        raise "O argumento tem que ser objeto de Graphite" unless graphite.instance_of? Graphite
        return "O grafite tem calibre incompatível" unless graphite.caliber == @caliber
        return "Já existe grafite na lapiseira" unless @graphite.nil?
        @graphite = graphite
    end

    def remove
        temp, @graphite = @graphite, nil unless @graphite.nil?
    end

    def write
        return "Não tem grafite na lapiseira" if @graphite.nil?
        return "O grafite está muito pequeno" unless @graphite.size > 10
        if (@graphite.size - 10) < @graphite.consumption_per_page
            @graphite.size = 0
            return "Folha incompleta"
        end
        @graphite.size -= @graphite.consumption_per_page
        if @graphite.size <= 10
            return "Grafite acabou"
        end
        @graphite.size
    end

    def to_s
        "Calibre: #@caliber, Grafite: #@graphite"
    end
end