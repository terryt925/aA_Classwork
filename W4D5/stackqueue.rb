require_relative "mystack"


class StackQueue

  def initialize
    @store_1 = MyStack.new
    @store_2 = MyStack.new 
  end

  def size 
    @store_1.size + @store_2.size 
  end

  def empty?
    size == 0
  end

  def enqueue(item)
    @store_1.push(item)
  end

  def dequeue
    return @store_2.pop unless @store_2.empty?
    until @store_1.empty?
      @store_2.push(@store_1.pop)
    end

  end


end