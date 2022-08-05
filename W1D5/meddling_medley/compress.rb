=begin
compress
Write a method compress that accepts a string as an argument. The method should return a "compressed" version of the string where streaks of consecutive letters 
are translated to a single appearance of the letter followed by the number of times it appears in the streak. If a letter does not form a streak (meaning that it appears alone), 
then do not add a number after it.
=end

def compress(str)
  arr = []
  count = 1
  new_str = ""
  str.each_char.with_index do |char, i|
    if char == str[i+1]
        count+= 1
        next
    else
        arr << [char, count]
        count = 1
    end
  end
  arr.each do |subArray|
    if subArray[1] > 1
        new_str+= subArray[0] + subArray[1].to_s
    else
        new_str+= subArray[0]
    end
  end
  new_str
end


p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"

