class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position # need to implement exception handling
        pos = []
        p "Player #{@mark}, enter two numbers representing a position in the format `row col`"
        gets.chomp.split(" ").each {|ele| pos << ele.to_i}

        unless pos.length == 2
            raise ArgumentError.new "Entered an invalid pos."
        end
        return pos
    end
    


end

#p1 = HumanPlayer.new
#p p1.get_position