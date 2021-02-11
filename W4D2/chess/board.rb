class Board

  BLACK_PIECES = {
    Pawn.new()
  }

  attr_reader :rows
  def initialize
    @null_piece = NullPiece.instance
    @rows = Array.new(8) {Array.new(8, @null_piece)}
  end

  
  def [](position)
    row,col = position
    @rows[row][col]
  end
  
  def []=(position,value)
    row,col = position
    @rows[row][col] = value
  end
  
  def valid_pos(pos) #may need to change when we add opponent pieces
    row, col = pos
    return true if row.between(0..7) && col.between(0..7)
    false
  end
  
  def move_piece(start_pos, end_pos)
    raise "invalid start position" if self[start_pos] != @null_piece
    raise "invalid end position" if self[end_pos] != @null_piece
    

    piece = self[start_pos] 
    self[end_pos] = piece
    self[start_pos] = @null_piece
  end

  def pieces

  end

  def add_piece(piece,pos)
    self[pos] = piece
  end

  # valid_pos( current_pos[2, 3]  + hori_dir[0, 1] == [2, 4]) = true
end