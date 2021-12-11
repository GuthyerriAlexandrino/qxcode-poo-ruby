# frozen_string_literal: true

require_relative 'node'

# Double linked list
class Deque
  attr_reader :size

  def initialize
    @type = nil
    @first = nil
    @last = nil
    @size = 0
  end

  def push_front(elem)
    type_checker(elem.class)
    temp = @first
    @first = Node.new(elem)
    @first&.next = temp
    temp&.previous = @first
    @last = @first unless size.positive?
    @size += 1
    @first
  end

  def push_back(elem)
    type_checker(elem.class)
    if @first.nil?
      @size += 1
      return @first = @last = Node.new(elem)
    end
    @last&.next = Node.new(elem)
    @last&.previous = @last
    @size += 1
    @last = @last&.next
  end

  def front
    @first&.data
  end

  def back
    @last&.data
  end

  def [](index)
    raise 'Invalid index' unless index >= 0 && index < @size

    node = @first
    method = 'next'
    if index > @size / 2
      node = @last
      method = 'previous'
    end
    index.times { node = node.send(method) }
    node&.data
  end

  def []=(index, value)
    raise 'Invalid index' unless index >= 0 && index < @size

    node = @first
    method = 'next'
    if index > @size / 2
      node = @last
      method = 'previous'
    end
    index.times { node = node.send(method) }
    node&.data = value
  end

  def pop_front
    raise 'Cannot erase on empty list' if empty?

    temp = @first
    @first = @first&.next
    @first&.previous = nil
    @size -= 1
    temp.data
  end

  def pop_back
    raise 'Cannot erase on empty list' if empty?

    temp = @last
    @last = @last&.previous
    @last&.next = nil
    @size -= 1
    temp.data
  end

  def erase(pos1, pos2 = nil)
    pos2.nil? ? in_erase(pos1, pos1) : in_erase(pos1, pos2)
  end

  def clear
    @first = nil
    @last = nil
    @size = 0
    GC.start
  end

  def each
    node = @first
    until node.nil?
      yield node.data
      node = node.next
    end
  end

  def each_pair
    index = 0
    node = @first
    until node.nil?
      yield node.data, index
      node = node.next
      index += 1
    end
  end

  def empty?
    @size.zero?
  end

  # def to_s
  #
  # end

  private

  def type_checker(type)
    @type ||= type
    raise 'Type fault!' unless @type == type

    true
  end

  def in_erase(pos1, pos2)
    raise 'Cannot erase on empty list' if empty?
    raise 'Invalid position' unless pos_checker(pos1) && pos_checker(pos2) && pos1 <= pos2

    node = nil
    if pos1 > size / 2
      node = @last
      pos1.upto(@size) { node = node.previous }
    else
      node = @first
      1.upto(pos1) { node = node.next }
    end

    pos1.upto(pos2) do
      node&.previous&.next = node&.next
      node&.next&.previous = node&.previous
      node = node&.next
      @size -= 1
    end
  end

  def pos_checker(pos)
    pos >= 0 && pos < @size
  end
end
