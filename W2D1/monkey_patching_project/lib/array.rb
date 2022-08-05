# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    return self.sort[-1] - self.sort[0]
  end

  def average
    return nil if self.empty?
    return self.sum / self.length.to_f
  end

  def median
    sorted = self.sort
    length = sorted.length
    return nil if self.empty?
    (sorted[(length - 1) / 2] + sorted[length / 2]) / 2.0
  end

  def counts
    hash = Hash.new(0)
    self.each {|ele| hash[ele]+=1}
    return hash
  end

  def my_count(value)
    count = 0
    self.each {|ele| count+=1 if ele == value}
    return count
  end

  def my_index(value)
    self.each_with_index {|ele, i| return i if ele == value }
    return nil
  end

  def my_uniq
    hash = Hash.new(0)
    self.each {|ele| hash[ele]+=1}
    return hash.keys
  end

  def my_transpose
    max = self[0].length
    new_arr = Array.new(max) {Array.new()}

    (0...max).each do |first| #outer
        self.each do |subArr|
            subArr.each_with_index do |ele, last|
                if first == last
                    new_arr[first] << ele
                end
            end
        end
    end
    return new_arr
  end

end
