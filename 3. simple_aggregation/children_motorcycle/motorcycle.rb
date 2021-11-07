class Motorcycle
    
    def initialize(power)
        @person = nil
        @power = power
        @time = 0
    end

    def buy(time)
        @time += time unless time <= 0
    end

    def drive(time)
        raise "Só crianças de 10 anos abaixo podem dirigir" unless @person.age <= 10
        raise "Compre mais minutos, por favor" unless @time > 0
        "Você andou #@time minutos e acabou o tempo" unless @time - time > 0
    end

    def honk
        "P" << @power.times.collect{ "e" }.join('') << "m"
    end

    def in(person)
        raise "Você deve embarcar um objeto de Person" unless person.instance_of? Person
        return false unless @person.nil?
        @person = person
        true
    end

    def out
        temp, @person = @person, nil
    end

    def to_s
        "Potencia: #@power, Minutos: #@time, Pessoa: [#@person]"
    end
end