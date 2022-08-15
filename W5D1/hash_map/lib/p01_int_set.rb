require 'byebug'

class MaxIntSet

  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(50, false)
  end

  def insert(num)
    self[num] = true if is_valid?(num)
  end

  def remove(num)
    self[num] = false
  end

  def include?(num)
    return true if @store[num]
    return false
  end

  private

  def []=(num, bool)
    @store[num] = bool
  end

  def is_valid?(num)
    raise "Out of bounds" if num > @max || num < 0
    return true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    idx = num % 20
    self[idx].delete(num)
  end

  def include?(num)
    idx = num % 20
    return true if self[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    return @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self[num].include?(num)
      self[num] << num
      @count+=1
    end
    self.resize! if @count >= @store.length
  end 

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count-=1
    end
  end

  def include?(num)
    return true if self[num].include?(num)
    return false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    idx = num % @store.length
    return @store[idx]
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
