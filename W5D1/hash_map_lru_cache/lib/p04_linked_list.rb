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
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key,val)
    if @head.next == @tail && @tail.prev == @head
      @head.next = new_node
      @tail.prev = new_node
      new_node.next = @tail
      new_node.prev = @head
      return
    end
    @tail.prev.next = new_node
    new_node.prev = @tail.prev
    @tail.prev = new_node
    new_node.next = @tail
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each(&prc)
    list_vals_yielded = []
    current_node = @head
   # while current_node !=
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
