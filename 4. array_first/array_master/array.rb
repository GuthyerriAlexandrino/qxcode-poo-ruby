class Container
    
    def initialize
        @array = []
    end

    def add(element, position = -1)
        raise "position must be a valid index" unless position.instanceof? Integer
        if position > -1
            @array.insert(position, element)
        end

    end

    def clear

    end

    def contains(element)

    end

    def get(index)

    end

    def index_of(element)

    end

    def empty?

    end

    def last_index_of(element)

    end

    def remove(index)

    end

    def set(index, element)

    end

    def size

    end
end