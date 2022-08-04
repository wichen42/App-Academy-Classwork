# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
  arr = factor(num_1).concat(factor(num_2)).sort! # combine array of factors of num1 and num2 and sorts in ascending order

  (2...arr.length - 1).each do |i| # start at index 2. helper method includes 1 therefore first two elements is always 1
    if arr[i] == arr[i+1] 
        return false
    end
  end
  return true
end

def factor(num) # generate an array of factors from number
  arr = []
  (1..num).select {|i| arr << i if num % i == 0}
  return arr
end

# solution with none? - returns true if condition is not satisfied

def coprime?(num_1, num_2)
  (2..num_1).none? {|div| num_1 % div == 0 && num_2 % div == 0}
end


p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false

##additional tests should all be true
#p coprime?(2,15)
#p coprime?(3,8)
#p coprime?(4,9)
#p coprime?(5,6)
#p coprime?(11,14)
#p coprime?(15,19)
#
##additional tests should all be false
#p coprime?(2,4)
#p coprime?(4,16)
#p coprime?(6,48)
#p coprime?(20,100)
#p coprime?(6,10)

