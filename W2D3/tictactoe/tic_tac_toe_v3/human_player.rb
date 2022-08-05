class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        pos = []
        p "Player #{@mark}, enter two numbers representing a position in the format `row col`"
        gets.chomp.split(" ").each {|ele| pos << ele.to_i}

        while !legal_positions.include?(pos)
            p "Invalid position. Please re-enter: "
            pos = []
            gets.chomp.split(" ").each {|ele| pos << ele.to_i}
        end
        return pos
    end
    


end

#p1 = HumanPlayer.new(:X)
##p p1.get_position([[1,2],[2,1],[3,1]])
#p p1
