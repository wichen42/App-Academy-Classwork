require "byebug"
=begin
Write a method consecutive_collapse that accepts an array of numbers as an argument. The method should return a new array that 
results from continuously removing consecutive numbers that are adjacent in the array. If multiple adjacent pairs are consecutive numbers, 
remove the leftmost pair first. For example:

[3, 4, 1] -> [1]
because 3 and 4 are consecutive and adjacent numbers, so we can remove them
[1, 4, 3, 7] -> [1, 7]
because 4 and 3 are consecutive and adjacent numbers, so we can remove them
[3, 4, 5] -> [5]
because 4 and 3 are consecutive and adjacent numbers, we don't target 4 and 5 since we should prefer to remove the leftmost pair
We can apply this rule repeatedly until we cannot collapse the array any further:

# example 1
[9, 8, 4, 5, 6] -> [4, 5, 6] -> [6]

# example 2
[3, 5, 6, 2, 1] -> [3, 2, 1] -> [1]
=end

def consecutive_collapse(arr)
  new_arr = []
  prev = 0
  nex = 0
  i = 0

    while i < arr.length
      pre = arr[i]-1
      nex = arr[i]+1

      if i == 0 # first index
        if pre == arr[i+1] || nex == arr[i+1]
          i+=2
        else
          new_arr << arr[i]
        end
      elsif i == arr.length-1 # last index
        return 
        if pre == arr[i-1] || nex == arr[i-1]
          i = arr.length
        else
          new_arr << arr[i]
        end
      else # middle indexes
        if (pre == arr[i-1] || nex == arr[i-1]) # if prev ele is conseq

        elsif (pre == arr[i+1] || nex == arr[i+1]) # if next ele is conseq
    
        end
      end
        
    end

new_arr
end

p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []


#    arr.each_with_index do |num, idx|
#      #debugger
#      pre = num - 1
#      nex = num + 1
#    if idx == 0 # first index #TODO need to account for both pre and next /// better to use a while loop to control index
#        if nex == arr[idx+1] || pre == arr[idx+1]
#            next
#        else
#            new_arr << num
#        end
#    elsif idx == arr.length-1 # last index
#        if pre == arr[-2] || nex = arr[-2]
#            #new_arr << nil
#            next
#        else
#            new_arr << num
#        end
#    else # middle indexes
#    end
  #end
