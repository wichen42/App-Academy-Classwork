require_relative "./board.rb"
require_relative "./card.rb"

class Game


    def initialize
        @board = Board.new
        @previous_positions = []
        @board.populate
        @board.render
        @remaining_guesses = 10
    end


    def get_position
        p "Please enter a position."
        pos = gets.chomp.split(" ").map(&:to_i)
        raise "Invalid Pos" if pos.length != 2
        return pos
    end

    def win?
        return true if @board.won?
        return false
    end

    def lose?
        if @remaining_guesses == 0
            return true
        end
        return false
    end


    def game_over?
        win? || lose?
    end


    def play

     while game_over? == false
            pos_1 = get_position
            @previous_positions << pos_1
            @board.reveal(pos_1) # first reveal
            @board.render # one revealed
            pos_2 = get_position
            @previous_positions << pos_2
            @board.reveal(pos_2)
            @board.render
            if @board.grid[pos_1[0]][pos_1[1]] != @board.grid[pos_2[0]][pos_2[1]]
                @board.grid[pos_1[0]][pos_1[1]].hide
                @board.grid[pos_2[0]][pos_2[1]].hide
                @remaining_guesses -= 1
            else
                previous_positions << pos_1
                previous_positions << pos_2
            end
        end

        if  self.win?
            p "You win!"
            return true
        elsif self.lose?
            p "You Lose"
            return false
        end

    end


end