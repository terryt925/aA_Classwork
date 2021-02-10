require_relative "slideable.rb"
require_relative "stepable.rb"


class Piece

def initialize(color,board,pos)
  @color = symbol
  @board = board
  @position = pos
end

# def moves

# end
def to_s
  self.symbol
end

def symbol

end

def empty?(pos)
  @board[pos] == NullPiece.instance
end

end