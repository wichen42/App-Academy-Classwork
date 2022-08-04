# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

def bubble_sort(arr)
  sorted = true 

  (0...arr.length - 1).each do |i| # range of 0 - arr.length - 1 determines the indexes
    if arr[i] > arr[i+1] # if first ele > second ele swap
        arr[i], arr[i+1] = arr[i+1], arr[i] # swap ele
        sorted = false # set sorted to false since a swap occured
    end
  end
  if sorted == false # if sorted = false recursivley call method with the updated sorted arr as argument
    bubble_sort(arr)
  end
  arr
end

p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]