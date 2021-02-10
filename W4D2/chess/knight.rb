require_relative "piece"
class Knight < Piece

include Stepable

def symbol

end

def move_diffs
  x,y = self.position

  all_moves = [
    [x-2, y-1],
    [x-2, y+1],
    [x-1, y+2],
    [x-1, y-2],
    [x+1, y+2],
    [x+1, y-2],
    [x+2, y-1],
    [x+2, y+1]
  ]

end

end