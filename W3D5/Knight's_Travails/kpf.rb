require_relative "./poly_tree.rb"
class KnightPathFinder

    POSSIBLE_POS = [[-1,-2], [1, -2], [2,-1], [-2,-1], [-2,1], [2,1],[-1,2], [1,2]]

    attr_reader :valid, :considered_pos, :tree, :start_pos, :root

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
        #@tree = []
    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)
        valid_moves = possible_moves.select {|pos| !@considered_pos.include?(pos)}
        valid_moves.each {|pos| @considered_pos << pos}
        return valid_moves
    end

    def populate_children(node)
        positions = new_move_positions(node.value)
        positions.each {|pos| node.add_child(PolyTreeNode.new(pos))}
    end

    def build_move_tree
        queue = [@root]
        until queue.empty?
            el = queue.shift
            # every potential pos => create a new node and add new_move_positions as its child
            populate_children(el)
            el.children.each {|child| queue << child}
        end
    end

    def find_path(end_pos)
        queue = [@root]
        until queue.empty?
            el = queue.shift
            return trace_path_back(el).reverse if el.value == end_pos
            el.children.each {|child| queue << child}
        end
    end

    def trace_path_back(end_node)
        path = []
        queue = [end_node]
        until queue.empty?
            el = queue.shift
            path << el.value
            return path if el.parent.nil?
            queue << el.parent
        end
    end

end

#kpf = KnightPathFinder.new([0,0])
#kpf.build_move_tree
#p kpf.considered_pos
#p kpf.new_move_positions([1,2])
#kpf.build_move_tree

#p kpf
#kpf.populate_children
#p kpf.root
#p kpf.find_path([5,4])
#p kpf.trace_path_back([0,0])
#p kpf.find_path([0,0])



