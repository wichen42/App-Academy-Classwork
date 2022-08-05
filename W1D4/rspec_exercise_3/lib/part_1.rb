def is_prime?(num)
  return false if num < 2
  (2...num).each {|ele|return false if num % ele == 0}
  true
end

def nth_prime(n)
  arr = []
  
  i = 0
  while arr.length < n
    arr << i if is_prime?(i)
    i+=1
  end

  arr[-1]
end

def prime_range(min, max)
  arr = []
  (min..max).each {|num| arr << num if is_prime?(num)}
  arr
end