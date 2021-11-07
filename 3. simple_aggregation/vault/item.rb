class Item
    attr_reader :description, :volume

    def initialize(description, volume)
        @description = description
        @volume = volume
    end

    def to_s

    end
end