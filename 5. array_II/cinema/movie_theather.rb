# frozen_string_literal: true

require_relative '../../DEs/deque'
require_relative 'client'

# Class who implements the theather
class MovieTheather
  attr_reader :chairs

  def initialize(capacity)
    @chairs = Deque.new
    1.upto(capacity) { @chairs.push_front(nil) }
  end

  def reservar(name, phone, chair_num)
    raise 'chair_num must be of type Integer' unless chair_num.instance_of? Integer
    raise 'Invalid index' unless chair_num >= 0 && chair_num < @chairs.size
    return 'Already reserved a chair' unless check_chairs(name)
    return 'This chair is already reserved' unless @chairs[chair_num].nil?

    chair_num -= 1
    @chairs[chair_num] = Client.new(name, phone)
    ".......................\n.\tReserva       ." \
    "\n. Cadeira: #{chair_num + 1}         .\n." \
    " Cliente: #{name}  .\n......................."
  end

  def cancelar(name)
    @chairs.each_pair { |person, key| @chairs[key] = nil if person&.name == name }
  end

  def to_s
    str = '[ '.dup
    @chairs.each { |person| person.nil? ? str << '- ' : str << person.to_s << ' ' }
    str << ']'
  end

  private

  def check_chairs(name)
    @chairs.each { |person| return false if person&.name == name }
    true
  end
end
