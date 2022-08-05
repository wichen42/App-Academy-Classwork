require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player, :size

    def initialize(num)
        @player = Player.new
        @board = Board.new(num)
        @remaining_misses = (num * num) / 2
        @size = num * num
    end

    def start_game
        @board.place_random_ships
        p @size / 4
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            p "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        if win? || lose?
            return true
        else
            return false
        end
    end

    def turn
        move = @player.get_move # arr of 2 num for pos i.e [4,2]
        if @board.attack(move)
            @board.print
            p @remaining_misses
        else
            @remaining_misses-=1
            @board.print
            p @remaining_misses
        end
    end

end
