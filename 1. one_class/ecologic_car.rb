class Car
    
    def initialize(gas_max, pass_max)
        @gas_max, @pass_max = gas_max, pass_max
        @gas = @km = @pass = 0
    end

    def drive(km)
        return "Não há ninguém no carro" if @pass <= 0
        @gas, @km = @gas - km, @km + km unless km <= 0 || @gas <= 0
        if @gas < 0
            return_value = "Tanque vazio após andar #{@km + @gas}"
            @km, @gas = @km + @gas, 0
            return return_value
        end
        "Dirigiu por #{km} quilômetros"
    end

    def enter
        control = @pass += 1 unless @pass >= @pass_max
        return (control) ? "Um passageiro entrou" : "Não cabe mais ninguém no carro"
    end

    def fuel(gas)
        @gas = (@gas + gas) unless gas < 0
        @gas = @gas_max if @gas > @gas_max
        @gas
    end

    def leave
        control = @pass -= 1 unless @pass <= 0
        return (control) ? "Um passageiro desceu" : "Não há passageiro para descer"
    end

    def to_s
        "Passageiros: #@pass, Gasolina: #@gas, Quilometragem: #@km"
    end
end