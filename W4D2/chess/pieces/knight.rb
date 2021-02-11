require_relative "piece"
require_relative "stepable"
class Knight < Piece

include Stepable


def initialize(color,board,pos)

  super
end

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