class Coin
    attr_reader :volume, :value 
    def initialize(value)
        values = [0.10, 0.25, 0.5, 1]
        volumes = [1, 2, 3, 4]
        raise "Apenas 0.1, 0.25, 0.5, 1 são valores permitidos" unless values.include?(value)
        @value = value
        @volume = volumes[values.find_index(value)]
    end
end