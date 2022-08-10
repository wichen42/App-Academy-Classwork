module Slideable

    def get_cross(cur_pos)
        cross = {:up => [], :down => [], :left => [], :right => []}
        x, y = cur_pos

        ((y + 1)..7).each {|i| cross[:down] << [x, i]}
        (0...y).each {|i| cross[:up] << [x, i]}
        ((x + 1)..7).each {|i| cross[:right] << [i, y]}
        (0...x).each {|i| cross[:left] << [i, y]}

        cross[:up].reverse!
        cross[:left].reverse!
        return cross
    end

    def in_bound?(pos)
        return pos.all? {|ele| ele.between?(0,7)}
    end

    def get_diagonals(cur_pos)
        diagonals = {:up_left => [], :up_right => [], :down_left => [], :down_right => []}
        x, y = cur_pos
        (1..7).each do |i|

            diagonals[:up_right] << [x+i, y+i] if in_bound?([x+i, y+i]) 
            diagonals[:down_left] << [x-i, y-i] if in_bound?([x-i, y-i])
            diagonals[:down_right] << [x+i, y-i] if in_bound?([x+i, y-i])
            diagonals[:up_left] << [x-i, y+i] if in_bound?([x-i, y+i])
        end

        return diagonals
    end

end

