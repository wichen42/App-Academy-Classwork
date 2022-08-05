require "byebug"
=begin
A "Mersenne prime" is a prime number that is one less than a power of 2. This means that it is a prime number with the form 2^x - 1, 
where x is some exponent. For example:

3 is a Mersenne prime because it is prime and 3 = 2^2 - 1
7 is a Mersenne prime because it is prime and 7 = 2^3 - 1
11 is not a Mersenne prime because although it is prime, it does not have the form 2^x - 1
The first three Mersenne primes are 3, 7, and 31. Write a method mersenne_prime that accepts a number, n, as an argument 
and returns the n-th Mersenne prime.


=end

def mersenne_prime(n)
  arr = []
  x = 1
  while arr.length < n
    m = ((2**x)-1)
    arr << m if prime?(m)
    x+=1
  end
  
  arr[-1]
end

def prime?(n)
  return false if (2...n).any? {|ele| n % ele == 0}
  true
end


p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071
p mersenne_prime(7)