class Player

    def get_move
        p "enter a position with coordinates separated with a space like `4 7`"
        input = []
        gets.chomp.split(" ").each {|char| input << char.to_i}
        return input
    end

end
