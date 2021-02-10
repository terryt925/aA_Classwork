class Board

  attr_reader :rows
  def initialize
    @null_piece = NullPiece.instance
    @rows = Array.new(8) {Array.new(8, @null_piece)}
  end

  def move_piece(start_pos, end_pos)
    raise "invalid start position" if self[start_pos] != @null_piece
    raise "invalid end position" if self[end_pos] != @null_piece
    

    piece = self[start_pos] 
    self[end_pos] = piece
    self[start_pos] = @null_piece
  end
  
  def [](position)
    row,col = position
    @rows[row][col]
  end

  def []=(position,value)
    row,col = position
    @rows[row][col] = value
  end



end