require "byebug"
# 9387
def partition(arr, num) # return 2d array: first arr < num : second arr > num
  less = []
  more = []

  arr.map {|ele| ele < num ? less << ele : more << ele}
  [less, more]
end

#p partition([11, 5, 13, 2, 3], 7) # => [[5, 2, 3], [11, 13]]
#p partition([1, 2, 4, 3, 5, 7], 5) # => [[1, 2, 4, 3], [5, 7]]
#p partition([1, 2, 4, 3], 0) # => [[], [1, 2, 4, 3]]

def merge(hash_1, hash_2) # return new hash containing key-value from both
  new_hash = {}
  hash_1.each {|key, value| new_hash[key] = value}
  hash_2.each {|key, value| new_hash[key] = value}
  new_hash
end

hash_1 = {"a"=>10, "b"=>20}
hash_2 = {"c"=>30, "d"=>40, "e"=>50}

#p merge(hash_1, hash_2) # => {"a"=>10, "b"=>20, "c"=>30, "d"=>40, "e"=>50}

def censor(sen, arr) # return sentence where every vowel in curse words replaced by *
  sen_arr = sen.split(" ") # array of words from sen

  sen_arr.each do |word| 
    if arr.include?(word.downcase) # if word in arr censor word
      word.each_char.with_index do |char, i|
        if "aeiou".include?(char.downcase)
          word[i] = "*" # replace char with *
        end
      end
    end
  end
  sen_arr.join(" ")
end

# censor("Gosh darn it", ["gosh", "darn", "shoot"])
# censor("SHUT THE FRONT DOOR", ["door"])

def power_of_two?(num) 
  return true if num == 1
  while num != 1
    return false if num % 2 != 0
    num = num / 2.0
  end
  true
end

# power_of_two?(16)
# power_of_two?(32)
# power_of_two?(64)
# power_of_two?(1)
# power_of_two?(6)
# power_of_two?(7)
# power_of_two?(28)
# power_of_two?(100)

