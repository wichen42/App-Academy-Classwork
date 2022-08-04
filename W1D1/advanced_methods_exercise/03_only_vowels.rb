# Write a method, `only_vowels?(str)`, that accepts a string as an arg.
# The method should return true if the string contains only vowels.
# The method should return false otherwise.

def only_vowels?(str)
  vowels = "aeiou"

  str.each_char do |char|
    if vowels.include?(char.downcase) == false # evaluate each char in str, return false if there is any char that is not a vowel
        return false
    end
  end
  return true
end


# solution with all?
def only_vowels?(str)
  vowels = "aeiou"
  str.split.all? {|char| vowels.include?(char)}
end


p only_vowels?("aaoeee")  # => true
p only_vowels?("iou")     # => true
p only_vowels?("cat")     # => false
p only_vowels?("over")    # => false


