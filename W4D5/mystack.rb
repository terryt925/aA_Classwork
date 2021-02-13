class MyStack

  def initialize
    @store = []
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end

  def push(item)
    @store << item
  end

  def pop
    @store.pop
  end

  def peek
    @store[-1]
  end

end