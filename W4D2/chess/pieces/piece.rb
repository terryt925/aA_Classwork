require_relative "slideable.rb"
require_relative "stepable.rb"


class Piece

  attr_accessor :position

def initialize(color,board,pos)
  @color = color 
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



def valid_moves?
end

def pos=(val)
  self.position = val
end

private

def move_into_check?(end_pos)

end

end #end of class