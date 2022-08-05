=begin
triplet_true?
Write a method triplet_true? that accepts a string as an argument and returns a boolean indicating whether or not the string contains three of the same character consecutively.
=end

def triplet_true?(str)
  str.each_char.with_index {|char, i| return true if char == str[i+1] && char == str[i+2]}
  false
end

p triplet_true?('caaabb')        # true
p triplet_true?('terrrrrible')   # true
p triplet_true?('runninggg')     # true
p triplet_true?('bootcamp')      # false
p triplet_true?('e')             # false