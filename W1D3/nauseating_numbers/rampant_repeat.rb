=begin
Write a method rampant_repeats that accepts a string and a hash as arguments. 
The method should return a new string where characters of the original string are repeated the number of times specified by the hash. 
If a character does not exist as a key of the hash, then it should remain unchanged.
=end

def rampant_repeats(string, hash)
  new_string = ""

  string.each_char do |char|
    if hash.include?(char)
        new_string += char * hash[char]
    else
        new_string+=char
    end
  end
  new_string
end

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'