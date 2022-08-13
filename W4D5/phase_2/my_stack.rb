class Stack

    def initialize
        @store = []
    end

    def peek
        return @store.last
    end

    def size
        return @store.length
    end

    def empty?
        return @store.empty?
    end

    def pop
        @store.pop
    end

    def push
        @store.push
    end

end