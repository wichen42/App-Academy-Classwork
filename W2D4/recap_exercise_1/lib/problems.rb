require 'byebug'
# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    arr = []
    pairs = words.combination(2).to_a

    pairs.each do |pairs|
        #debugger
        vowels = {"a" => 0, "e" => 0, "i" => 0, "o" => 0, "u" => 0}
        sent = pairs.join(" ")
        sent.each_char do |char|
            vowels[char]+=1 if vowels.include?(char)
        end
        arr << sent if vowels.any?{|k, v| v == 0} == false
    end
    return arr
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    factors = []
    #debugger
    (1..num).each {|factor| factors << factor if num % factor == 0}
    return true if factors.length > 2
    return false 
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    arr = []
    bigrams_hash = {}
    bigrams.each {|ele| bigrams_hash[ele] = 0}
    str.split(" ").each do |word|
        bigrams.each {|bg| bigrams_hash[bg]+=1 if word.include?(bg)}
    end
    bigrams_hash.each {|k,v| arr << k if v > 0}
    return arr

end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        hash = {}
        prc ||= Proc.new {|k, v| k == v}
        self.each do |k, v|
            hash[k] = v if prc.call(k, v) 
        end
        return hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        substrings = []
        (0...self.length).each do |start_idx|
            (start_idx...self.length).each do |end_idx|
                substrings << self[start_idx..end_idx]
            end
        end
        length == nil ? substrings : substrings.select{|sub| sub.length == length}
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        arr = []
        abc = ("a".."z").to_a
        self.each_char.with_index do |char, i|
            abc_idx = abc.find_index(char)
            new_idx = (abc_idx+num) % 26
            arr << abc[new_idx]
        end
        return arr.join("")
    end
end
