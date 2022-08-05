require_relative "./card.rb"

class Board
    DICTIONARY = ["A", "B", "C", "D", "E", "F", "G", "H"]
    attr_reader :grid

    def initialize
        @grid = []
        instance_1 = DICTIONARY.map { |mark| Card.new(mark) } 
        instance_2 = DICTIONARY.map { |mark| Card.new(mark) } 
        @cards = (instance_1 + instance_2).shuffle
    end

    def populate
        new_arr = @cards
        @grid = new_arr.each_slice(4).to_a
    end

    def render
        hidden_grid = Array.new(4) { Array.new(4)}
        hidden_grid.each_with_index do |row, i|
            row.each_with_index do |ele, j|
                if @grid[i][j].face_down == true
                    hidden_grid[i][j] = "x"
                elsif @grid[i][j].face_down == false
                    hidden_grid[i][j] = @grid[i][j].value
                end
            end
        end
        puts hidden_grid.map { |row| row.join(" ") }
    end

    def won?
        arr = @grid.flatten
        arr.all? {|card| card.face_down == false }
    end

    def reveal(pos)
        row, col = pos
        @grid[row][col].reveal
    end

end