# frozen_string_literal: true

require_relative 'movie_theather'

mt = MovieTheather.new(5)
mt.reservar('Guthyerri', '981597487', 2)
puts mt
mt.cancelar('Guthyerri')
puts mt