require 'byebug'

class Board
  
    attr_reader :size, :row
    
    def initialize(num)
        @grid = Array.new(num) {Array.new(num, :N)}
        @size = num * num
        @row = num
    end

    def [](arr) # grabs value at pos
        #row = arr[0]
        #column = arr[1]
        #@grid[row][column]

        row, col = pos
        @grid[row][col]

    end

    def []=(arr, value) # changes value at pos
        row = arr[0]
        column = arr[1]
        @grid[row][column] = value
    end

    def num_ships
        count = 0
        @grid.each do |subArr|
            subArr.each {|ele| count+=1 if ele == :S}
        end
        return count
    end

    def attack(arr)
        if self.[](arr) == :S
            p "you sunk my battleship!"
            self.[]= arr, :H
            return true
        else
            self.[]= arr, :X
            return false
        end
    end
    # flatten to make single arr -> mutate 25% of ele into :S -> arr.each_slice(num_rows)
    def place_random_ships 
        #debugger
        new_grid = @grid.flatten
        final_grid = []
        random_idx = Array.new(new_grid.count / 4) {rand(0..35)}
        random_idx.each do |ship_idx|
            new_grid.each.with_index do |ele, grid_idx| # bug squashed: i was comparing ele of random_idx to ele of new_grid instead of the index
                if ship_idx == grid_idx
                    final_grid << :S
                else
                    final_grid << :H
                end
            end
        end
        @grid = final_grid.each_slice(@row).to_a
    end

    def hidden_ships_grid
        new_grid = @grid.flatten
        new_grid.each_with_index {|ele, i| new_grid[i] = :N if ele == :S}
        new_grid.each_slice(@row).to_a
    end

    def self.print_grid(matrix)
        puts matrix.map {|ele| ele.join(' ')}
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
