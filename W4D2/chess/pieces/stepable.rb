module Stepable 

  def moves
    potential_moves = []
    move_diffs.each do |pos|
      potential_moves << pos if board.valid_pos(pos)
    end
    potential_moves
  end


end