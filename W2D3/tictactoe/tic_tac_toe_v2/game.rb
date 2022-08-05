require_relative "./board.rb"
require_relative "./human_player.rb"

class Game

    attr_reader :player_1, :player_2, :current_player
    attr_writer :current_player

    def initialize(*marks, n)
        @current_player = []
        marks.each {|mark| @current_player << HumanPlayer.new(mark)}
        @board = Board.new(n)
    end

    def switch_turn
        @current_player.rotate!
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player[0].get_position, @current_player[0].mark)
            if @board.win?(@current_player[0].mark) 
                p "Victory! #{@current_player[0].mark}, won!"
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
