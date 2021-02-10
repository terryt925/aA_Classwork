module Slideable 
HORIZONTAL_DIRS = [
  [1,0],
  [-1,0],
  [0,1],
  [0,-1]
]

DIAGONAL_DIRS = [
  [1,1],
  [1,-1],
  [-1,1],
  [-1,-1]
]

def horizontal_dirs
  return HORIZONTAL_DIRS
end

def diagonal_dirs
  return DIAGONAL_DIRS
end

def moves
  all_moves = []
  self.move_dirs.each do |dir|
    all_moves + self.grow_unblocked_moves_in_dir(dir)
  end
  all_moves
end

private

def grow_unblocked_moves_in_dir(dx, dy)
  potential_moves = []
  row = dx
  col = dy
  valid = true
  while valid
    if valid_pos([row, col])
      potential_moves << [row, col]
      row += dx
      col += dy
    else
      valid = false
    end
  end
  potential_moves
end




end