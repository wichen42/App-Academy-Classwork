require_relative "./poly_tree.rb"
class KnightPathFinder

    POSSIBLE_POS = [[-1,-2], [1, -2], [2,-1], [-2,-1], [-2,1], [2,1],[-1,2], [1,2]]

    attr_reader :valid, :considered_pos

    def self.valid_moves(pos)
        row, col = pos
        output = POSSIBLE_POS.map do |pos_arr|
            x, y = pos_arr
            if (row+x).between?(0,7) && (col+y).between?(0,7)
                [row+x, col+y]
            end
        end
        return output.compact
    end

    def initialize(start_pos)
        @start_pos = start_pos
        @considered_pos = [@start_pos]
        @root = PolyTreeNode.new(start_pos)
        @tree = {}
    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)
        possible_moves.select {|pos| !@considered_pos.include?(pos)}
    end

    def build_move_tree
        
    end

    def find_path

    end
end

kpf = KnightPathFinder.new([0,0])
#kpf.build_move_tree
#p kpf.considered_pos
#p kpf.new_move_positions([3,3])


