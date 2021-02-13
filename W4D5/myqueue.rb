class MyQueue

  def initialize
    @store = []
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end

  def enqueue(item)
    @store << item
  end

  def dequeue
    @store.shift
  end

  def peek
    @store[0]
  end

end