require_relative "piece"
class Queen < Piece

include Slideable
def initialize
  
end
def move_dirs
  horizontal_dirs + diagonal_dirs
end


end

