require "byebug"

def zip(*array)
  new_arr = Array.new(array[0].length) {Array.new()} # create an empty array with rows = # arr
  array.each do |arr|
    arr.each_with_index do |ele, i|
        new_arr[i] << ele
    end
  end
  new_arr
end

#array_1 = ['a', 'b', 'c']
#array_2 =  [1, 2, 3] 
#array_3 = ['w', 'x', 'y']
#
#p zip(array_1, array_2)
#p zip(array_2, array_1)
#p zip(array_1, array_2, array_3)

def prizz_proc(arr, prc1, prc2)
  new_arr = []
  arr.each do |ele|
    if (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && (prc2.call(ele)))
        new_arr <<ele
    end
  end
  new_arr
end

def zany_zip(*array) # todo
  max_size = 0
  array.each {|arr| max_size = arr.length if arr.length > max_size}
  
  (0...max_size).map do |i| # map returns an array [0, 1, 2, 3].map { array.map {subarr[i]}} subArr[i] = ele
    array.map {|arr| arr[i]}
  end
end

array_1 = ['a', 'b', 'c'] 
array_2 = [1, 2, 3] 
array_3 = [11, 13, 15, 17] 
array_4 = ['v', 'w', 'x', 'y', 'z'] 

p zany_zip(array_1, array_2)
p zany_zip(array_2, array_1)
p zany_zip(array_3, array_2, array_1)
p zany_zip(array_1, array_2, array_3, array_4)

def maximum(arr, &prc)
  return nil if arr.length == 0
  hash = Hash.new()
  arr.each {|ele| hash[ele] = prc.call(ele)}
  hash = hash.sort_by {|k,v| v}
  hash.to_a.last[0]
end

#p maximum([2, 4, -5, 1]) { |n| n * n }
#p maximum(['potato', 'swimming', 'cat']) { |w| w.length }
#p maximum(['boot', 'cat', 'drop']) { |w| w.length }


def my_group_by(arr, &prc)
  hash = {}
  arr.each {|ele| hash[prc.call(ele)] = []}
  arr.each do |ele|
    if hash.include?(prc.call(ele))
        hash[prc.call(ele)] << ele
    end
  end
  hash
end

#array_1 = ['mouse', 'dog', 'goat', 'bird', 'cat']
#array_2 = [1, 2, 9, 30, 11, 38]

#p my_group_by(array_1) { |s| s.length }
#p my_group_by(array_1) { |s| s.include?('o') }
#p my_group_by(array_2) { |n| n % 3 }

def max_tie_breaker(arr, prc, &blc)
  return nil if arr.length == 0
  size = []
  arr.each_with_index {|ele| size << [ele, blc.call(ele)] }
  max_value = 0
  max_ele = ""
  tie_value = 0
  tie_ele = ""
  answer = ""

  size.each do |results|
    if results[1] > max_value
        max_value = results[1]
        max_ele = results[0]
    end
  end
  
  size.each do |results|
    if results.include?(max_value)
        tie_value = results[1]
        tie_ele = results[0]
    end
  end
  
  if max_value == tie_value
    if prc.call(max_ele) > prc.call(tie_ele)
        answer = max_ele
    elsif prc.call(tie_ele) > prc.call(max_ele)
        answer = tie_ele
    elsif prc.call(max_ele) == prc.call(tie_ele)
        answer = max_ele
    end
  else
    answer = max_ele
  end
  answer
  #p max_ele
  #p max_value
  #p tie_ele
  #p tie_value
end

#array_1 = ['potato', 'swimming', 'cat']
#array_2 = ['cat', 'bootcamp', 'swimming', 'ooooo']
#array_3 = ['photo','bottle', 'bother']
#length = Proc.new { |s| s.length } 
#o_count = Proc.new { |s| s.count('o') }
#
#p max_tie_breaker(array_1, o_count, &length) # swimming
#p max_tie_breaker(array_2, length, &o_count) # ooooo
#p max_tie_breaker(array_2, o_count, &length) # bootcamp
#p max_tie_breaker(array_3, o_count, &length) # bottle

def silly_syllables(sent)
  vowels = "aeiou"
  new_sentence = []
  first_idx = 0
  first_vowel = ""
  last_idx = 0
  last_vowel = ""
  
  sent.split(" ").each_with_index do |word|
    if word.count('aeiou') < 2
        new_sentence << word
        next
    end

    (0...word.length).each do |i|
        if vowels.include?(word[i])
            first_idx = i
            first_vowel = word[i]
            break
        end
    end
    (word.length-1).downto(0).each do |i|
        if vowels.include?(word[i])
            last_idx = i
            last_vowel = word[i]
            break
        end
    end

    new_sentence << word[first_idx..last_idx]
    #p first_vowel
    #p last_vowel
  end   
  new_sentence.join(" ")
end

#p silly_syllables('properly precisely written code')
#p silly_syllables('the trashcans collect all my garbage')