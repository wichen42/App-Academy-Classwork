class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    hash = key.hash
    if !self[hash].include?(key)
      self[hash] << key
      @count+=1
    end
    self.resize! if @count >= @store.length
  end

  def include?(key)
    hash = key.hash
    return true if self[hash].include?(key)
    return false
  end

  def remove(key)
    hash = key.hash
    if self[hash].include?(key)
      self[hash].delete(key)
      @count-=1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    return @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(@store.length * 2) {Array.new}
    @store.flatten.each do |ele|
      idx = ele % new_store.length
      new_store[idx] << ele
      #debugger
    end
    @store = new_store
  end
end
