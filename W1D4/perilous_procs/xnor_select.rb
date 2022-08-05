=begin
Write a method xnor_select that accepts an array and two procs as arguments. The method should return a new array containing elements of the original array 
that either return true for both procs or return false for both procs.
=end

def xnor_select(arr, prc1, prc2)
    new_arr = []
    arr.each {|ele| new_arr << ele if (prc1.call(ele) == true && prc2.call(ele) == true) || (prc1.call(ele) == false && prc2.call(ele) == false)}
    new_arr
end

is_even = Proc.new { |n| n % 2 == 0 }
is_odd = Proc.new { |n| n % 2 != 0 }
is_positive = Proc.new { |n| n > 0 }
p xnor_select([8, 3, -4, -5], is_even, is_positive)         # [8, -5]
p xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)  # [-7, -13, 12]
p xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)   # [5, -10]