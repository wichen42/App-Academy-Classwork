require "byebug"

def select_even_nums(arr) # return arr with only even nums
  arr.select {|num| num % 2 == 0}
end

def reject_puppies(arr)
  arr.reject {|hash| hash["age"] < 3}
end

def count_positive_subarrays(arr) # TODO: Need to incorporate Array#count
  arr.count {|subarray| subarray.sum > 0}
end

def aba_translate(str) # transform word by putting a 'b' + vowel after the vowel
  vowels = "aeiou"
  arr = []
  str.each_char {|char| vowels.include?(char) ? arr << char + "b" + char : arr << char} 
  arr.join("")
end

def aba_array(arr) # return every word in arr aba_translated
  arr.map {|word| aba_translate(word)}
end

