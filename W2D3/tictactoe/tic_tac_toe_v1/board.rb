class Board

    attr_writer :grid

    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def valid?(pos)
        return false if pos.any? {|ele| ele > 2 || ele < 0}
        return true
    end

    def empty?(pos)
        row = pos[0]
        col = pos[1]
        return true if @grid[row][col] == "_"
        return false
    end

    def place_mark(pos, mark)
        return p "The position is not valid." if valid?(pos) == false
        return p "The position is already taken." if empty?(pos) == false
        if valid?(pos) && empty?(pos)
            @grid[pos[0]][pos[1]] = mark
        end
    end

    def print
        puts @grid.map {|ele| ele.join(' ')}
    end

    def win_row?(mark) # return true if a mark has all rows filled
        @grid.each do |row|
            return true if row.all? {|ele| ele == mark}
        end
        return false
    end

    def win_col?(mark)
        arr = @grid.transpose
        arr.each {|col| return true if col.all? {|ele| ele == mark}}
        return false
    end

    def win_diagonal?(mark)
        diag_1 = [@grid[0][0], @grid[1][1], @grid[2][2]]
        diag_2 = [@grid[0][2], @grid[1][1], @grid[2][0]]
        return true if diag_1.all? {|ele| ele == mark} || diag_2.all? {|ele| ele == mark}
        return false
    end

    #def win_diagonal?(mark)
    #    ltr = (0...@grid.length).all? {|i| @grid[i][i] == mark}
    #    rtl = (0...@grid.length).all? {|i| @grid[i][(@grid.length-1)-i] == mark}
    #    ltr || rtl
    #end

    def empty_positions?
        @grid.each {|row| return true if row.any? {|pos| pos == "_" }}
        return false
    end

    def win?(mark)
        return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
        return false
    end

end

#board = Board.new

#board.place_mark([0,0], :X)
#board.place_mark([0,1], :X)
#board.place_mark([0,2], :X)
#board.place_mark([1,0], :X)
#board.place_mark([1,1], :X)
#board.place_mark([1,2], :X)
#board.place_mark([2,0], :X)
#board.place_mark([2,1], :X)
#board.place_mark([2,2], :X)

#board.print

#p board.win_diagonal?(:X)
