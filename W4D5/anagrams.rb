
def anagram?(str1, str2)
    combination = str1.split("").permutation(str1.length).to_a
    combination.map {|ele| ele.join("")}.include?(str2)
end


#p anagram?("gizmo", "sally")    #=> false
#p anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
    str_arr = str2.split("") # n
    str1.each_char do |char| # n 
        idx = str_arr.find_index(char)
        return false if idx.nil?
        #p str_arr
        #p idx
        str_arr.delete_at(idx)
    end
    return true if str_arr.empty?
    return false
end

#p second_anagram?("gizmo", "sally")    #=> false
#p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2)
    str1.split("").sort == str2.split("").sort
end

#p third_anagram?("gizmo", "sally")    #=> false
#p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str1, str2)
    #hash1 = Hash.new(0)
    #hash2 = Hash.new(0)
#
    #str1.each_char {|char| hash1[char]+=1}
    #str2.each_char {|char| hash2[char]+=1}
#
    #hash1 == hash2

    hash = Hash.new(0)
    str1.each_char {|char| hash[char]+=1}
    str2.each_char {|char| hash[char]-=1}

    hash.each_value.all? { |v| v == 0}

end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true