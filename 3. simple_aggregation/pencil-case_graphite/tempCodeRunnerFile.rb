def remove
        temp, @graphite = @graphite, nil unless @graphite.nil?
    end