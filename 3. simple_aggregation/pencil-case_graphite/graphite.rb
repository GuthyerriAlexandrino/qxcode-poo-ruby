class Graphite
    attr_accessor :size
    attr_reader :caliber

    def initialize(caliber, hardness, size)
        raise "Erro, durezas aceitáveis são: HB, 2B, 4B ou 6B" unless ["HB", "2B", "4B", "6B"].include?(hardness)
        @caliber = caliber
        @hardness = hardness
        @size = size
    end

    def consumption_per_page
        case @hardness
        when "HB" then 1
        when "2B" then 2
        when "4B" then 4
        when "6B" then 6
        end
    end

    def to_s
        "[#@caliber:#@hardness:#@size]"
    end
end