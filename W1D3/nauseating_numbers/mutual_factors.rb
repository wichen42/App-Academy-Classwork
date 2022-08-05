=begin
Write a method mutual_factors that accepts any amount of numbers as arguments. The method should return an array containing all of the 
common divisors shared among the arguments. For example, the common divisors of 50 and 30 are [1, 2, 5, 10]. You can assume that all of 
the arguments are positive integers.
=end

def mutual_factors(*args)
  hash = Hash.new(0)

  args.each do |ele|
    divisors(ele).each {|div| hash[div]+=1}
  end
  arr = []
  hash.each {|key, value| arr << key if value == args.length}
  arr
end

def divisors(num)
  (1..num).select {|f| num % f == 0}
end

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]