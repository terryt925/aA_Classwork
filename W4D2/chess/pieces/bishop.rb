require_relative "piece"
require_relative "slideable"
class Bishop < Piece

include Slideable

def initialize(color,board,pos)

  super
end

def move_dirs
  self.diagonal_dirs
end

def symbol
end

end