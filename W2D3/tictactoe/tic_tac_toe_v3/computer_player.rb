class ComputerPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        legal_positions[rand(0...legal_positions.length)]
    end

end


#hal = ComputerPlayer.new(:C)
#p hal.get_position([[1,2], [1,1], [2,3]])
#p hal