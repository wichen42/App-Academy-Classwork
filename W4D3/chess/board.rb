require 'byebug'
require_relative "piece.rb"

class Board

    attr_accessor :grid

    def initialize
        @grid = Array.new(8) {Array.new(8)}
        @sentinel = NullPiece.instance
    end


    def [](pos)
        return @grid[pos[1]][pos[0]]
    end

    def []=(pos, piece)
        @grid[pos[1]][pos[0]] = piece
    end

    def empty?(pos)
        #debugger
        return self[pos] == @sentinel
    end

    def populate_board 
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                @grid[i][j] = @sentinel
            end
        end

    end

    def dup
        return @grid.map {|el| el.is_a?(Array) ? el.dup : el}
    end


    def move_piece(start_pos, end_pos)
        raise "can't move null piece" if self[start_pos].is_a?(NullPiece)
        raise 'there is a piece there' if !self[end_pos].is_a?(NullPiece)

        self[start_pos] , self[end_pos] = self[end_pos], self[start_pos]
        self[start_pos] = NullPiece.instance
        self[end_pos].pos = end_pos
    end

    def print_board
        puts @grid.map {|row| row.map(&:symbol).join(" ")}
    end

end

b = Board.new
p "===-=-=-=-=-=-=-="
#b.print_board
b.populate_board
b.print_board
king = Knight.new(:W, b, [0, 0])
bishop1 = Pawn.new(:W, b, [0, 0])
bishop2= Bishop.new(:W, b, [0, 0])
bishop3 = Bishop.new(:W, b, [0, 0])
bishop4 = Bishop.new(:W, b, [0, 0])
bishop5 = Bishop.new(:W, b, [0, 0])

b[[0,0]] = king
b[[5,5]] = bishop1
b[[2,4]] = bishop2
b[[3,5]] = bishop3
b[[4,1]] = bishop4
b[[1,1]] = bishop5
b.print_board

p "========"
b.move_piece([0,0], [4,4])
b.print_board
p king.valid_moves
p king.valid_moves.length

