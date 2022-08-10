require "byebug"
require_relative "stepable.rb"
require_relative "slideable.rb"
require "singleton"
class Piece

    attr_reader :color, :symbol, :pos
    attr_writer :pos
    #include Stepable
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
    end

    def empty?
    end

    def valid_moves
        return []
    end

    private

    def move_into_check?(end_pos)
        next_board = @board.dup
        next_board.move_piece(@pos, end_pos)
        next_board.each do |rows|
            rows.each do |ele|
                if ele.color == :W && @color == :B || ele.color == :B && @color == :W
                    return true if ele.valid_moves.any? {|move| next_board[move].is_a?(King) && next_board[move].color == @color}
                end
            end
        end
        return false
    end

end

class NullPiece < Piece
    include Singleton
    def initialize
        @symbol = :_
        @color = nil
        @pos = nil
    end
end

class Pawn < Piece

    def initialize(color, board, pos)
        super
        @symbol = color == :W ? "\u2659".encode("utf-8") : "\u265F".encode("utf-8")
    end

    def valid_moves
        valid = []

        if @color == :W && @pos[1] == 1
            if @board[[@pos[0], @pos[1] + 1]].empty?
                valid << [@pos[0], @pos[1] + 1]
                valid << [@pos[0], @pos[1] + 2] if @board[[@pos[0], @pos[1] + 2]].empty?
            end
        elsif @color == :B && pos[1] == 6
            if @board[[@pos[0], @pos[1] - 1]].empty?
                valid << [@pos[0], @pos[1] - 1]
                valid << [@pos[0], @pos[1] - 2] if @board[[@pos[0], @pos[1] - 2]].empty?
            end 
        end

        if @color == :W
            x, y = @pos
            valid << [x - 1, y + 1] if @board[[x - 1, y + 1]].color == :B
            valid << [x + 1, y + 1] if @board[[x + 1, y + 1]].color == :B
            valid << [x, y + 1] if !valid.include?([x, y + 1])
        else
            x, y = @pos
            valid << [x - 1, y - 1] if @board[[x - 1, y - 1]].color == :W
            valid << [x + 1, y - 1] if @board[[x + 1, y - 1]].color == :W
            valid << [x, y - 1] if !valid.include?([x, y - 1])
        end

        return valid.map {|el| el if el.all? {|ele| ele.between?(0,7)}}
    end


end

class Rook < Piece
    include Slideable

    def initialize(color, board, pos)
        super
        @symbol = color == :W ? "\u2656".encode("utf-8") : "\u265C".encode("utf-8")
    end

    def valid_moves
        cross = get_cross(@pos)
        valid = []

        cross.each do |k, v|
            v.each do |pos|
                if @board.empty?(pos)
                    valid << pos
                else
                    valid << pos if @board[pos].color != @color
                    break
                end
            end
        end

        return valid
    end

end

class Bishop < Piece
    include Slideable

    def initialize(color, board, pos)
        super
        @symbol = color == :W ? "\u2657".encode("utf-8") : "\u265D".encode("utf-8")
    end

    def valid_moves
        #debugger
        diagonals = get_diagonals(@pos)
        #p diagonals
        #debugger
        valid = []
        diagonals.each do |k,v|
            v.each do |position|
                if @board.empty?(position) 
                    valid << position
                else
                    valid << position if @board[position].color != @color
                    break
                end
            end
        end
        return valid
    end
end

class Queen < Piece
    include Slideable
    def initialize(color, board, pos)
        super
        @symbol = color == :white ? "\u2655".encode("utf-8") : "\u265B".encode("utf-8")
    end

    def valid_moves
        
        valid = []
        
        cross = get_cross(@pos)
        cross.each do |k, v|
            v.each do |pos|
                if @board.empty?(pos)
                    valid << pos
                else
                    valid << pos if @board[pos].color != @color
                    break
                end
            end
        end

        diagonals = get_diagonals(@pos)
        diagonals.each do |k,v|
            v.each do |position|
                if @board.empty?(position) 
                    valid << position
                else
                    valid << position if @board[position].color != @color
                    break
                end
            end
        end

        return valid
    end

end

class King < Piece
    include Stepable

    def initialize(color, board, pos)
        super
        @symbol 
    end

    def possible_moves
        deltas = [[1,0],[1,1],[0,1],[-1,0],[-1,1],[0,-1],[1,-1], [-1,-1]]
        return get_valid_moves(deltas, @pos).map {|m| m if @board[m].color != @color && !move_into_check?(m)}.compact
    end

end


class Knight < Piece
    include Stepable

    def initialize(color, board, pos)
        super
        @symbol = color == :white ? "\u2654".encode("utf-8") : "\u265A".encode("utf-8")
    end

    def valid_moves
        deltas = [[-1, -2], [1, -2], [2, -1], [-2, -1], [-2, 1], [2, 1], [-1, 2], [1, 2]]
        return get_valid_moves(deltas, @pos).map {|m| m if @board[m].color != @color && !move_into_check?(m)}.compact
    end

end

