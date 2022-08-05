# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num) # return largest prime divisor
  div_arr = divisor(num)
  div_arr.reverse.each {|ele| return ele if is_prime?(ele) == true}
end

def divisor(n)
  arr = []
  (1..n).each {|num| arr << num if n % num == 0}
  arr
end

def is_prime?(n)
  return false if n < 2
  
  (2...n).each {|num| return false if n % num == 0 }

  true
end

def unique_chars?(str)
  str.each_char {|char| return false if str.count(char) > 1}
  true
end

def dupe_indices(arr) # return hash: keys = dupe ele, values = idx of ele
  hash = Hash.new {|h, key| h[key] = []}

  arr.each_with_index {|ele, idx| hash[ele] << idx}
  
  hash.delete_if {|key,value| value.length < 2}
  hash
end

def ana_array(arr1, arr2) # return true if both arrays contain same elements
  hash = Hash.new(0)
  arr1.each {|ele| hash[ele]+=1}
  arr2.each {|ele| hash[ele]+=1}

  hash.each {|key, value| return false if value % 2 != 0}
  true
end

