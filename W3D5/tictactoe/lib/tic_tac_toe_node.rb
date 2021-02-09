require_relative 'tic_tac_toe'

class TicTacToeNode

attr_reader :board, :next_mover_mark, :parent

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @parent = prev_move_pos
    #@children = []
  end

  def children
    output = []
    @board.rows.each do |pos|
      if pos.empty?
        self.new(board.dup, next_mover_mark, pos)
        output << pos
      end
    end
    output
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  # def children
  # end
end
