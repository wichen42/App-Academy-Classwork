# Debug this code to pass rspec! There is 1 mistake to fix.

# Write a method, fuzz_buzz, that accepts a number as an arg. 
# The method should return an array of numbers from one to the given number that are not divisible by 3 or 5.

require "byebug"

def fuzz_buzz(num)
    numbers = []

    (1..num).each do |i|
        if i % 3 != 0 && i % 5 != 0
            numbers << i
        end
    end

    numbers
end

# Error - || instead of &&

p fuzz_buzz(11) # => [1, 2, 4, 7, 8, 11]
p fuzz_buzz(20) # => [1, 2, 4, 7, 8, 11, 13, 14, 16, 17, 19]