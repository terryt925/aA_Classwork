class PolyTreeNode
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent
    @parent
  end

  def parent=(new_parent)
    @parent.children.delete(self) if @parent != nil
    if new_parent == nil
      @parent = nil
    else
      @parent = new_parent
      @parent.children << self if !@parent.children.include?(self)
    end
  end

  def children
    @children
  end

  def value
    @value
  end

  def add_child(child)  # old_child.add_child(child)  cur_node.add_child(new_node)
    child.parent = self
  end

  def remove_child(old_child)
    raise "error" if !self.children.include?(old_child) #!= nil
    old_child.parent = nil if old_child.parent != nil
  end

  def dfs(target)
    return self if self.value == target
    return nil if self.children.empty?
    self.children.each do |ele|
      output = ele.dfs(target)
      return output if output != nil #&& output.value == target
    end
    nil
  end

  def bfs(target)
    queue = [self]
    while !queue.empty?
      node = queue.shift
      return node if node.value == target
      queue += node.children
    end
    nil
  end

end


# class Searchable
#   def dfs(target)
#     return self if self.value == target
#     self.children.each do |idx|
#       dfs(idx)
#     end
#   end
# end