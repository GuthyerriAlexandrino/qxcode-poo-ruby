class Node
    attr_accessor :data, :next, :previous
    def initialize(elem)
        @data = elem
        @next = nil
        @previous = nil
    end

    def to_s
        "#{@data}"
    end
end