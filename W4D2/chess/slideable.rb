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

private

# def move_dir(value)
#   return HORIZONTAL_DIRS if value == horizontal
#   return DIAGONAL_DIRS if value == diagonal
#   return HORIZONTAL_DIRS + DIAGONAL_DIRS
# end

private



end