=begin
conjunct_select
Write a method conjunct_select that accepts an array and one or more procs as arguments. The method should return a new array containing the elements that 
return true when passed into all of the given procs.
=end

def conjunct_select(arr, *prc)
  new_arr = []
  arr.each do |ele|
    count = 0
    prc.each do |proc|
        count+=1 if proc.call(ele)
    end
    new_arr << ele if count == prc.length
  end
  new_arr
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]