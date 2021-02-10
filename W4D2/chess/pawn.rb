require_relative "piece"
class Pawn < Piece

def symbol
  :♟
end

def moves

end

private

def at_start_row?
  x,y = position
  return true if x == 1 && self.color = :♟ || x == 6
  false
end

def forward_dir #returns 1 or -1
  
  if self.color == :♟
    return -1
  else
    return 1
  end
end

def forward_steps 

end

def side_attacks

end


end