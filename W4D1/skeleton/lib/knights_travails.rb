require "byebug"
require_relative "00_tree_node.rb"

class KnightPathFinder

  attr_reader :root_node

  def self.valid_moves(pos)
    output = []
    
  end

  def initialize(start_pos)
    # @pos = start_pos
    @root_node = start_pos
    @considered_positions = [start_pos]
  end

  def new_move_Positions(pos)
    arr = KnightPathFinder.valid_moves(pos)
    output = []
    arr.each do |node|
      if !@considered_positions.include?(node)
        @considered_positions << node
        output << node
      end
    end
    return output
    
    # if !@considered_positions.include?(pos)
    
    #   @considered_positions << pos
    #   return pos
    # end
  end

end





