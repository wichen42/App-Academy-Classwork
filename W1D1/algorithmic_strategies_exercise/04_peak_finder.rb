# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr)
  new_arr = []
  if arr[0] > arr[1] # shovel first ele in new_arr if it is larger than next ele
    new_arr << arr[0]
  end
  if arr[-1] > arr[-2] # shovel last ele in new_arr if it is larger than prev ele
    new_arr << arr[-1]
  end
  
  (1...arr.length-1).each do |i| # generate indexes in between first and last ele
    if arr[i] > arr[i-1] && arr[i] > arr[i+1] # shovel ele at arr[i] if it is larger than prior and next ele
        new_arr << arr[i]
    end
  end

  new_arr
end

p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]
