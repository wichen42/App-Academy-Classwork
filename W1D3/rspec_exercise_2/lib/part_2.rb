require "byebug"

def palindrome?(string) # true if string is same forward and backawards
  reversed = ""
  i = string.length-1
  i.downto(0).each {|idx| reversed+= string[idx]}
  string == reversed
end

#p palindrome?("tot")
#p palindrome?("racecar")
#p palindrome?("madam")
#p palindrome?("aa")
#p palindrome?("a")
#p palindrome?("cat")
#p palindrome?("greek")
#p palindrome?("xabcx")

def substrings(string) 
  arr = []
  string.length.times do 
    
    i = 0
    idx = 0
    while i < string.length # first pass => ["a", "ab", "abc", "abcd"]
      if i == 0
        arr << string[idx]
      else
        arr <<string[0..idx]
      end
      idx+=1
      i+=1
    end
    string = string[1..-1]
  end



  arr
end

#p substrings("jump")
#p substrings("abc")
#p substrings("x")
#p substrings("abcd")

def palindrome_substrings(string)
  arr = substrings(string)
  new_arr = []
  arr.each do |word|
    if palindrome?(word) == true
      new_arr << word
    end
  end
  new_arr.select {|word| word.length > 1}
end

p palindrome_substrings("abracadabra") # => ["aca", "ada"]
p palindrome_substrings("madam") # => ["madam", "ada"]
p palindrome_substrings("taco") # => []