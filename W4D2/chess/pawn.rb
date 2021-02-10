require_relative "piece"
class Pawn < Piece

def symbol
  white = :♟
  black = :♙
end

def moves
  all_moves = self.forward_steps + self.side_attacks
  all_moves.select {|pos| board.valid_pos?(pos)}
end

private

def at_start_row?
  x,y = position
  return true if x == 1 && self.color = :♙ || x == 6 && self.color == :♟
  false
end

def forward_dir 
  if self.color == :♙
    return 1
  else
    return -1
  end
end

def forward_steps 
  possible_steps = []
  x,y = self.position
  if self.at_start_row?
    possible_steps << [x+self.forward_dir, y]
    possible_steps << [x + 2*self.forward_dir, y]
  else
    possible_steps << [x+forward_dir, y]
  end
  possible_steps
end

def side_attacks
  attack = []
  if self.color = :♙ #[1,-1], [1, 1]
    attack.push([1,-1],[1,1])
  else
    attack.push([-1,1],[-1,-1])
  end
  attack
end


end