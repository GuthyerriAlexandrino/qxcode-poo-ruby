class Tamagotchi
    
    def initialize(energy, satiety, cleanliness)
        @energy, @max_energy = (0..1).map { energy }
        @satiety, @max_satiety = (0..1).map { satiety }
        @cleanliness, @max_cleanliness = (0..1).map { cleanliness }
        @diamonds = 0
        @age = 0
        @alive = true
        @divine_intervention = true
    end

    def alive?
        check_parameters if @alive
    end

    def can_ressurect?
        return "O tamas queria interagir, porém está lá no céu" unless @divine_intervention
        response = (@diamonds < 100) ? "O tamas queria interagir, porém está lá no céu"
                                     : ("O mensageiro local, morrendo de compaixão, decidiu que ajudaria seu pet\n" \
                                     << "Você só precisa pagar um valor de 100 diamantes pra custos de transporte\n" \
                                     << "O que você escolhe? (Sim ou Não)\n")
        return response if response[0...7] == "O tamas"
        puts response
        if  ["Sim", "sim", "SIM"].include?(gets().chomp())
            @energy = @max_energy
            @satiety = @max_satiety
            @cleanliness = @max_cleanliness
            @alive = true
            return "Morreu mas passa bem"
        end
        @divine_intervention = false
        "Se foi para sempre"
    end

    def eat
        return can_ressurect? unless @alive
        @energy -= 1
        @satiety += 4
        @cleanliness -= 2
        @age += 1
        if !alive?
            @energy = 0 unless @energy > 0
            @cleanliness = 0 unless @cleanliness > 0
        end
        self
    end

    def play
        return can_ressurect? unless @alive
        @energy -= 2
        @satiety -= 1
        @cleanliness -= 3
        @diamante += 1
        @age += 1
        if !alive?
            @energy = 0 unless @energy > 0
            @satiety = 0 unless @satiety > 0
            @cleanliness = 0 unless @cleanliness > 0
        end
        self
    end

    def sleep
        return can_ressurect? unless @alive
        rounds, @energy = @max_energy - @energy, @max_energy
        @age += rounds
    end

    def bath
        return can_ressurect? unless @alive
        @energy -= 3
        @satiety -= 1
        @cleanliness = @max_cleanliness
        @age += 2
        if !alive?
            @energy = 0 unless @energy > 0
            @satiety = 0 unless @satiety > 0
        end
    end
    
    def energy=(value)
        @energy = value
    end

    def satiety=(value)
        @satiety = value
    end

    def cleanliness=(value)
        @cleanliness = value
    end

    def energy
        @energy
    end

    def satiety
        @satiety
    end
    
    def cleanliness
        @cleanliness
    end

    def oooohhh_yeah
        @diamonds += 100
    end

    def to_s
        "E: #@energy/#@max_energy, S: #@satiety/#@max_satiety, C: #@cleanliness/#@max_cleanliness, D: #@diamonds, A: #@age"
    end

    private

    def check_parameters
        @alive = @energy > 0 && @cleanliness > 0 && @satiety > 0 
    end

end