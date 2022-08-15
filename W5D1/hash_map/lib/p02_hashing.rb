class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    total = 0
    self.each_with_index {|ele, i| i.even? ? total+=ele : total-=ele}
    return total.hash
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a
    total = 0
    self.each_char.each_with_index {|char, i| i.even? ? total+=alphabet.index(char.downcase) : total-=alphabet.index(char.downcase)}
    return total.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    characters = ("a".."z").to_a + (0..9).to_a
    total = 0
    self.each do |key, value|
      total += characters.index(value)
    end
    return total.hash
  end
end
