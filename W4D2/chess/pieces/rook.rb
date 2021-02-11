require_relative "piece"
require_relative "slideable"
class Rook < Piece
include Slideable

def initialize(color,board,pos)

  super
end

  def move_dirs
    self.horizontal_dirs
  end
  def symbol
    
  end

end