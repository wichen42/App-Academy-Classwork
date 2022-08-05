class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
        
    end

    def parent=(node)
        if @parent # if self has a parent delete self from old parent's children
            old_parent = @parent
            old_parent.children.delete(self)
        end
        @parent = node
        if !node.nil? # add self to node's children if its not nil
            node.children << self
        else
            return nil
        end
    end

    def add_child(node)
        node.parent=(self)
    end

    def remove_child(node)
        node.parent=(nil)
        raise "Node is not a Child" if !self.children.include?(node)
    end

    def dfs(target_value)
        return self if self.value == target_value
        self.children.each do |child|
            search_result = child.dfs(target_value)
            return search_result if search_result != nil
        end
        return nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            el = queue.shift
            return el if el.value == target_value
            el.children.each {|child| queue << child}
        end
    end

end