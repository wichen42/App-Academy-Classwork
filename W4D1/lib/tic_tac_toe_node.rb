require 'byebug'
require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_mov_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    next_move = []
    #debugger
    empty_tiles = empty_tiles(@board)

    empty_tiles.each do |pos|
      board_clone = @board.dup
      board_clone[pos] = @next_mover_mark
      @next_mover_mark == :x ? child_mark = :o : child_mark = :x
      #debugger
      child = TicTacToeNode.new(board_clone, child_mark, pos)
      next_move << child
    end
    #debugger
    p next_move
    return next_move
  end

  def empty_tiles(board)
    #debugger
    output = []
    (0..2).each do |i|
      (0..2).each do |j|
        #value = board.empty?([i,j])
        output << [i,j] if board.empty?([i,j])
      end
    end
    return output
  end

end
