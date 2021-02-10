require_relative "slideable.rb"
require_relative "stepable.rb"


class Piece

  attr_reader :position

def initialize(color,board,pos)
  @color = symbol
  @board = board
  @position = pos
end


def to_s  # ToDo
  self.symbol
end

def symbol # ToDo

end

def empty?(pos)
  @board[pos] == NullPiece.instance
end

end