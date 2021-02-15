class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    if !self.include?(key)
      self[key] << key.hash
      @count += 1
    end
  end

  def include?(key)
    self[key].include?(key.hash)
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key.hash) 
      @count -= 1
    end
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.dup
    @store = Array.new(num_buckets*2) {Array.new}
    @count = 0
    old_store.each do |bucket|
      bucket.each do |ele|
        self.insert(ele)
      end
    end
  end
end
