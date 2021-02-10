class Board

  attr_reader :rows
  def initialize
    @rows = Array.new(8) {Array.new(8, nil)}
    # @null_piece = NullPiece.instance
  end

  def move_piece(start_pos, end_pos)
    raise "invalid start position" if self[start_pos] != nil
    raise "invalid end position" if self[end_pos] != nil
    

    piece = self[start_pos] #wrap in conditionals
    self[end_pos] = piece
    self[start_pos] = nil
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