# Remove dups
# Array has a uniq method that removes duplicates from an array. 
#It returns the unique elements in the order in which they first appeared:

# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
# Write your own version of this method called my_uniq; 
#it should take in an Array and return a new array.

def my_uniq(arr)
    hash = Hash.new(0)
    arr.each { |ele| hash[ele] += 1 }
    hash.keys 
end

# Two sum
# Write a new Array#two_sum method that finds all pairs of positions where the elements at those positions sum to zero.

# NB: ordering matters. We want each of the pairs to be sorted smaller index before bigger index. We want the array of pairs to be sorted "dictionary-wise":

# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]

class Array

    def two_sum
        arr = []
        (0...self.length-1).each do |i|
            (i+1...self.length).each do |j|
                arr << [i,j] if self[i] + self[j] == 0
            end
        end
        return arr
    end
end

# My Transpose
# To represent a matrix, or two-dimensional grid of numbers, we can write an array containing arrays which represent rows:

def my_transpose(arr)
  new_arr = Array.new(arr[0].length) {Array.new()}

  (0...arr[0].length).each do |i|
    arr.each do |ele|
      new_arr[i] << ele[i]
    end
  end

  new_arr
end

def stock_picker(arr)
    margin = 0
    pairs = []
    (0...arr.length - 1).each do |i|
        (i+1...arr.length).each do |j|
            if arr[j] - arr[i] > margin
                margin = arr[j] - arr[i]
                pairs = [i,j]
            end
        end
    end
    return pairs
end