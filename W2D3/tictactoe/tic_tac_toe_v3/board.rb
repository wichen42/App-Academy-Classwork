class Board

    attr_writer :grid

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, "_")}
    end

    def valid?(pos)
        return false if pos.any? {|ele| ele > @grid[0].length-1 || ele < 0}
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
        count1 = 0
        count2 = 0
        @grid.each_with_index do |row, idx1|
            row.each_with_index do |ele, idx2|
                if idx1 == idx2
                    count1+=1 if ele == mark
                end
            end
        end
        arr = Array.new(@grid.length) {Array.new([])}
        (0...@grid.length).each {|ele| arr[ele] << ele}
        second_idx = @grid.length-1
        (0...@grid.length).each do |i|
            arr[i] << second_idx
            second_idx-=1
        end
        arr.each do |idx|
            count2+=1 if @grid[idx[0]][idx[1]] == mark
        end

        return true if count1 == @grid.length || count2 == @grid.length
        return false
    end
    

    def empty_positions?
        @grid.each {|row| return true if row.any? {|pos| pos == "_" }}
        return false
    end

    def win?(mark)
        return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
        return false
    end

    def legal_positions
        legal_pos = []
        (0...@grid.length).each do |idx1|
            (0...@grid.length).each do |idx2|
                legal_pos << [idx1, idx2] if @grid[idx1][idx2] == "_"
            end
        end
        return legal_pos
    end

end

#board = Board.new(3)

#board.place_mark([0,0], :X)
#board.place_mark([0,1], :X)
#board.place_mark([0,2], :X)
#board.place_mark([0,3], :X)
#board.place_mark([1,0], :X)
#board.place_mark([1,1], :X)
#board.place_mark([1,2], :X)
#board.place_mark([1,3], :X)
#board.place_mark([2,0], :X)
#board.place_mark([2,1], :X)
#board.place_mark([2,2], :X)
#board.place_mark([2,3], :X)
#board.place_mark([3,0], :X)
#board.place_mark([3,1], :X)
#board.place_mark([3,2], :X)
#board.place_mark([3,3], :X)

#board.print
##
##p board.win_diagonal?(:X)
#p board.legal_positions
