# frozen_string_literal: true

require_relative '../../DEs/deque'
require_relative 'kid'

# Class who controls I/O of children
class Playground

  def initialize
    @waiting = Deque.new
    @playing = Deque.new
  end

  def arrive(kid)
    raise 'kid must be of type Kid' unless kid.instance_of? Kid

    @waiting.push_back(kid)
  end

  def in
    @playing.push_back(@waiting.pop_front) unless @waiting.empty?
  end

  def out
    @playing.pop_front unless @playing.empty?
  end

  def remove(name)
    raise 'name must be of type String' unless name.instance_of? String

    @playing.each_pair { |kid, key| @playing.erase(key) if kid.name == name }
    @waiting.each_pair { |kid, key| @waiting.erase(key) if kid.name == name }
  end

  def to_s
    str = '=> '.dup
    @waiting.each { |kid| str << kid.to_s << ' '}
    str << '=> ['
    @playing.each { |kid| str << kid.to_s << ' ' }
    str << ']'
  end
end

