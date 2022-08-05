require "byebug"

def hipsterfy(str) # return word with its last vowel removed
  vowels = "aeiou"
  word_arr = str.split("")
  pos = 0
  
  word_arr.each_with_index do |char, idx|
    if vowels.include?(char)
        pos = idx
    end
  end
  if pos > 0 # TODO: works for rspec but will break if first char is a vowel
    word_arr.delete_at(pos)
  end
  word_arr.join("")
end

def vowel_counts(string)
  counts = Hash.new(0)
  vowels = "aeiou"
  string.downcase.each_char do |char|
    if vowels.include?(char)
      counts[char]+=1
    end
  end
  counts
end

def caesar_cipher(str, n)
  new_str = ""
  alphabet = "abcdefghijklmnopqrstuvwxyz"

  str.each_char do |char|
    if !(alphabet.include?(char))
        new_str+=char
    else
        start_pos = alphabet.index(char)
    last_pos = start_pos + n

    if last_pos >= 26
        last_pos = last_pos % 26
    end
    new_str+=alphabet[last_pos]
    end
  end
  new_str
end

p vowel_counts("code bootcamp") # => {"o"=>3, "e"=>1, "a"=>1}
p vowel_counts("williamsburg bridge") # => {"i"=>3, "a"=>1, "u"=>1, "e"=>1}
p vowel_counts("WILLIAMSBURG bridge") # => {"i"=>3, "a"=>1, "u"=>1, "e"=>1}

#p caesar_cipher("apple", 1) # => "bqqmf"
#p caesar_cipher("apple", 2) # => "crrng"
#p caesar_cipher("hello", 5) # => "mjqqt"
#p caesar_cipher("zebra", 4) # => "difve"
#p caesar_cipher("whoa", 26) # => "whoa"
#p caesar_cipher("whoa", 52) # => "whoa"
#
#p caesar_cipher("123 _-!?@%", 3)
#p caesar_cipher("hello world!", 1)
#p caesar_cipher("welcome to week 3, day 1", 2)