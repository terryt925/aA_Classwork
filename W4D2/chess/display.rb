require "colorize"
require_relative "cursor"
class Display

def initialize(board)
  @board = board
  @cursor_pos = Cursor.new([0,0],board)
end

end#end of class