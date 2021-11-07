class Vault
    
    def initialize(max_volume)
        @broken = false
        @itens = ""
        @value = 0
        @volume = 0
        @max_volume = max_volume
    end

    def add_item(item)
        raise "Erro, insira um Item" unless item.instance_of? Item
        return "Cofre já foi quebrado!" if @broken
        if @volume + item.volume <= @max_volume
            @itens << item.description << ", "
            @volume += item.volume
            return true
        end
        false
    end

    def add_coin(coin)
        raise "Erro, insira um Coin" unless coin.instance_of? Coin
        return "Cofre já foi quebrado!" if @broken
        if @volume + coin.volume <= @max_volume
            @volume += coin.volume
            @value += coin.value
            return true
        end
        false
    end

    def get_itens()
        @itens if @broken
    end

    def get_coins()
        @value if @broken
    end

    def break()
        @broken = true
    end

    def to_s
        "I: (#{@itens.chomp(", ")}), M: #@coins, V: #@volume/#@max_volume EQ: #@broken"
    end
end