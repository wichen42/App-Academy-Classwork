module Stepable

    def in_bound?(pos)
        return pos.all? {|ele| ele.between?(0,7)}
    end

    def get_valid_moves(deltas, cur_pos)
        c_x, c_y = cur_pos        

        possible_moves = deltas.map do |pos|
            x, y = pos[0], pos[1]
            [x + c_x, y + c_y] if in_bound?([x + c_x, y + c_y])
        end.compact

        return possible_moves
    end

end