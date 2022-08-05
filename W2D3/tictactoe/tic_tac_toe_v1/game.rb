require_relative "./board.rb"
require_relative "./human_player.rb"

class Game

    attr_reader :player_1, :player_2, :current_player
    attr_writer :current_player

    def initialize(mark1, mark2)
        @player_1 = HumanPlayer.new(mark1)
        @player_2 = HumanPlayer.new(mark2)
        @current_player = @player_1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark) 
                p "Victory! #{@current_player.mark}, won!"
                return true
            else
                self.switch_turn
            end
        end
        p "Draw, nobody won."
        return false
    end

end

#game = Game.new(:X, :O)
#
#game.play
