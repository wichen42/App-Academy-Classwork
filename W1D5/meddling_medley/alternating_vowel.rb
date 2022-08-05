=begin
alternating_vowel
Write a method alternating_vowel that accepts a sentence as an argument. The method should return a new sentence where the words alternate between having their first or last vowel removed. 

For example:

the 1st word should be missing its first vowel
the 2nd word should be missing its last vowel
the 3rd word should be missing its first vowel
the 4th word should be missing its last vowel
... and so on
Note that words that contain no vowels should remain unchanged. Vowels are the letters a, e, i, o, u.
=end

def alternating_vowel(sent)
  new_arr = []
  vowels = "aeiouAEIOU"
  sent.split(" ").each_with_index do |word, i|
    if word.split("").any? {|char| vowels.include?(char)} == false
        new_arr << word
    elsif i % 2 == 0
        new_arr << remove_first_vowel(word)
    else
        new_arr <<remove_last_vowel(word)
    end
   
  end
  new_arr.join(" ")
end

def remove_first_vowel(word)
  vowels = "aeiouAEIOU"
  word.each_char.with_index do |char, i|
    if vowels.include?(char)
        word = word[0...i] + word[i+1..-1]
        break
    end
  end
  word
end

def remove_last_vowel(word)
  vowels = "aeiou"
  (word.length-1).downto(0).each do |i|
    if vowels.include?(word[i])
        word = word[0...i] + word[i+1..-1]
        break
    end
  end
  word
end


p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"