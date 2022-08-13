class Queue

    def initialize
        @store = []
    end

    def peek
        return @store.first
    end

    def size
        return @store.length
    end

    def empty?
        return @store.empty?
    end

    def enqueue(ele)
        @store << ele
    end

    def dequeue
        return @store.shift
    end

end