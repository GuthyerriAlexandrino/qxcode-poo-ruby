class Person
    attr_reader :name, :age

    def initialize(name, age)
        @name, @age = name, age
    end

    def to_s
        "#@name:#@age"
    end
end