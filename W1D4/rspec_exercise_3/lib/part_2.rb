def element_count(arr)
  hash = Hash.new(0)
  arr.each {|ele| hash[ele]+=1}
  hash
end

def char_replace!(str, hash)
  str.each_char.with_index do |char, idx|
    if hash.include?(char)
        str[idx] = hash[char]
    end
  end
  str
end

def product_inject(arr)
  arr.inject {|acc, ele| acc * ele}
end