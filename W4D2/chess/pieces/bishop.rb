require_relative "piece"
require_relative "slideable"
class Bishop < Piece

include Slideable

def move_dirs
  self.diagonal_dirs
end

def symbol
end

end