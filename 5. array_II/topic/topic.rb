# frozen_string_literal: true

require_relative '../../DEs/deque'
require_relative 'passenger'

class Topic
  def initialize(capacity, priorities)
    @seats = Deque.new
    1.upto(capacity) { @seats.push_front(nil) }
    @priorities = priorities
  end

  def insert(name, idade)
    person = Passenger.new(name, idade)
    index = find_first_free_pos(person.priority?)
    index = find_first_free_pos(!person.priority?) unless index != -1
    raise 'Topic is full' unless index != -1

    @seats[index] = person
  end

  def remove(name)
    index = find_by_name(name)
    raise 'Cannot remove a non passenger' unless index != -1

    @seats[index] = nil
  end

  def to_s
    str = '['.dup
    count = 0
    @seats.each do |ps|
      str << (count < @priorities ? '@' : '=')
      str << (ps.nil? ? ' ' : "#{ps.to_s} ")
      count += 1
    end
    str << ']'
  end

  private

  def find_by_name(name)
    @seats.each_pair { |ps, key| return key if ps&.name == name }
    -1
  end

  def find_first_free_pos(priority)
    @seats.each_pair_after(@priorities) { |ps, key| return key if ps.nil? } unless priority
    @seats.each_pair { |ps, key| return key if ps.nil? }
    -1
  end
end
