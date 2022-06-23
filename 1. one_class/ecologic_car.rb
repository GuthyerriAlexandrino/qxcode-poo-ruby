class Car

  def initialize(gas_max, pass_max)
    @gas_max = gas_max
    @pass_max = pass_max
    @gas = @km = @pass = 0
  end

  def drive(km)
    return 'Não há ninguém no carro' if @pass <= 0

    unless km <= 0 || @gas <= 0
      @gas -= km
      @km += km
    end
    if @gas.negative?
      return_value = "Tanque vazio após andar #{@km + @gas}"
      @km += @gas
      @gas = 0
      return return_value
    end
    "Dirigiu por #{km} quilômetros"
  end

  def enter
    control = (@pass >= @pass_max ? @pass += 1 : nil)
    (control.nil? ? 'Um passageiro entrou' : 'Não cabe mais ninguém no carro')
  end

  def fuel(gas)
    @gas = (@gas + gas) unless gas.negative?
    @gas = @gas_max if @gas > @gas_max
    @gas
  end

  def leave
    control = (@pass.positive? ? @pass -= 1 : nil)
    (!control.nil? ? 'Um passageiro desceu' : 'Não há passageiro para descer')
  end

  def to_s
    "Passageiros: #{@pass}, Gasolina: #{@gas}, Quilometragem: #{@km}"
  end
end