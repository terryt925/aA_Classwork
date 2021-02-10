require_relative "piece"
require "singleton"
class NullPiece < Piece
  include Singleton
  def initialize
    @symbol = :_
    @color = "gray"
  end
  def moves
  end
  def symbol
  end

end