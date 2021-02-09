class Board


  def initialize
    @rows = Array.new(8) {Array.new(8, @null_piece)}
    @null_piece = NullPiece.instance
  end

  def move_piece(start_pos, end_pos)
    raise "invalid start position" if @rows[start_pos] == @null_piece
    raise "invalid end position" if @rows[end_pos] != @null_piece


    piece = @rows[start_pos] #wrap in conditionals
    @rows[end_pos] = piece
    #@rows[start_pos] = @null_piece
  end



end