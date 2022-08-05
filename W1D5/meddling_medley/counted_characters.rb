=begin
counted_characters
Write a method counted_characters that accepts a string as an argument. The method should return an array containing 
the characters of the string that appeared more than twice. The characters in the output array should appear in the same 
order they occur in the input string.
=end

def counted_characters(str)
  hash = Hash.new(0)
  str.split("").each {|char| hash[char]+=1}
  hash.keep_if {|k, v| v > 2}.keys
end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []