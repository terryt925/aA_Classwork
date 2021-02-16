class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
    @prev = nil
    @next = nil
  end
end

class LinkedList

  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @tail.prev = @head
    @head.next = @tail
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    return @head if @tail.key == nil && @tail.prev == @head
    @tail
  end

  def empty?
    @head.key == nil && @tail.key == nil
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    new_tail = Node.new(key,val)
    if @head.key == nil && @tail.key == nil
      @head = new_tail
      @tail = new_tail
      return
    end
    @tail.next = new_tail
    new_tail.prev = @tail
    @tail = new_tail
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
    list_vals_yielded = []
    
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
