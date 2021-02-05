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

  def remove_child

  end

end