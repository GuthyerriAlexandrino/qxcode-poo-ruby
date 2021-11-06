class Calculator
    
    def initialize(battery_max)
        @battery, @battery_max = battery_max
        @display = 0
    end

    def chargeBattery(volts)
        @battery = (@battery + volts) % batteryMax unless volts < 0 
    end

    def divide(numerator, denominator)
        raise "Battery needs charge" unless @battery > 0
        raise "Invalid division by zero" unless denominator > 0
        @display = numerator / denominator
    end

    def sum(num1, num2)
        raise "Battery needs charge" unless @battery > 0
        @display = num1 + num2
    end

    def +(num)
        sum(@display, num)
    end

    def /(denominator)
        divide(@display, denominator)
    end

    def useBattery
        return false unless @battery > 0
        @battery -= 1
        true
    end

    def to_s
        sprintf("%.2f", @display.round(2))
    end
end