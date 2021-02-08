require "byebug"
require_relative "00_tree_node.rb"

class KnightPathFinder

  attr_reader :root_node, :considered_positions

  def self.valid_moves(pos)
    x, y = pos
    output = [[x + 2, y + 1],
              [x + 2, y - 1],
              [x - 2, y + 1],
              [x - 2, y - 1],
              [x + 1, y + 2],
              [x - 1, y + 2],
              [x + 1, y - 2],
              [x - 1, y - 2]]
    output.select do |pos|
      pos[0] > -1 && pos[0] < 8 && pos[1] > -1 && pos[1] < 8
    end
    
  end

  def initialize(start_pos)
    @start_pos = start_pos
    @root_node = PolyTreeNode.new(start_pos)
    @considered_positions = [start_pos]
    

  end

  def new_move_Positions(pos)
    arr = KnightPathFinder.valid_moves(pos)
    output = []
    arr.each do |position|
      if !@considered_positions.include?(position)
        @considered_positions << position
        output << position
      end
    end
    return output
    
    # if !@considered_positions.include?(pos)
    
    #   @considered_positions << pos
    #   return pos
    # end
  end

  def build_move_tree
    queue = [@root_node]
    while !queue.empty?
      node = queue.shift
      new_move_Positions(node.value).each do |pos|
        child_node = PolyTreeNode.new(pos)
        queue << child_node
        node.add_child(child_node)
      end
    end
  end

  def find_path(end_pos)
    end_node = @root_node.bfs(end_pos)
    trace_path_back(end_node)
  end

  def trace_path_back(end_node)
    output = []
    cur_node = end_node
    while cur_node != nil
      output << cur_node
      cur_node = cur_node.parent
    end
    output.reverse
  end
  

end


k = KnightPathFinder.new([0, 0])
print k.build_move_tree
print k.considered_positions.length
print k.find_path([7, 7])


