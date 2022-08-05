require 'byebug'
# Warmup
# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.



# Exponentiation
# Write two versions of exponent that use two different recursions:

# # this is math, not Ruby methods.

# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

5**4
5 * (5 * 5 * 5 * 5)
(5 ** 2) * (5 ** 2)

def exp(b, n)
	return 1 if n == 0
	if n > 0
		b * exp(b, n-1)
	else
		(1.0 / b) * exp(b, n+1)
	end
end

 def exp_2(b, n)
	return 1 if n == 0
	return b if n == 1

	if n.even?
		val = exp(b, (n/2))
		val * val
	else
		val = exp(b, ((n-1)/2))
		val * val * b
	end
 end


# Deep dup
# The #dup method doesn't make a deep copy:

robot_parts = [
	["nuts", "bolts", "washers"],
	["capacitors", "resistors", "inductors"]
]

def deep_dup(arr)
		return arr.dup unless arr.any? {|ele| ele.is_a?(Array)}
		output = []
		output << arr[0].dup
		output += deep_dup(arr[1..-1])
end

# robot_clone = deep_dup(robot_parts)
# robot_clone[0][0] = "hello"
# #p robot_clone
# #p robot_parts
# p robot_clone.object_id
# p robot_clone[0].object_id
# p robot_clone[1].object_id

# p robot_parts.object_id
# p robot_parts[0].object_id
# p robot_parts[1].object_id

# Fibonacci
# Write a recursive and an iterative Fibonacci method. The method should take in an integer n and return the first n Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; you should be able to do this just passing a single argument for the number of Fibonacci numbers requested.

def fibonacci(n)
	return [0, 1].take(n) if n <= 2
	previous_fib = fibonacci(n-1)
	previous_fib << previous_fib[-1] + previous_fib[-2]
end

# Binary Search
# Write a recursive binary search: bsearch(array, target). Note that binary search only works on sorted arrays. Make sure to return the location of the found object (or nil if not found!). Hint: you will probably want to use subarrays.

# Make sure that these test cases are working:

def bsearch(arr, target)
	return nil if arr.length == 1 && arr[0] != target
	mid = nil

	if arr.length.odd?
		mid = ( arr.length / 2.0 ) - 0.5
	else #IF LENGTH EVEN
		mid = arr.length / 2
	end

	left = arr[0...mid]
	right = arr[mid+1..-1]

	if arr[mid] == target 
		return mid.to_i
	elsif arr[mid] > target # look at left half
		return nil if bsearch(left, target).nil?
		bsearch(left, target)

	else # look at right half
		return nil if bsearch(right, target).nil?
		(mid + 1 + bsearch(right, target)).to_i
	end
end


# p bsearch([1], 1) # => 0
# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 3) # => nil
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
# length 7
# IF EVEN LENGTH middle index is (length-1) / 2
# p bsearch([1, 2, 3, 4, 5, 6, 7], 7) # => 6

# if ODD length MID is (length/2) - 0.5

# Merge Sort

def merge_sort(arr)
	return arr if arr.length <= 1

	left = arr.take(arr.length / 2)
	right = arr.drop(arr.length / 2)
	
	sorted_left = merge_sort(left)
	sorted_right = merge_sort(right)

	merge(sorted_left, sorted_right)
end

def merge(left, right)
	output = []
	l = 0
	r = 0
	until output.length == left.length + right.length
		if left[l].nil?
			output += right[r..-1]
			break
		elsif right[r].nil?
			output += left[l..-1]
			break
		end


		if left[l] > right[r]
			output << right[r]
			r += 1
		else
			output << left[l]
			l += 1
		end
	end
	output
end

# p merge([3, 27, 38, 43], [9, 10, 82])
# p merge([3, 9], [10, 82])
# p merge_sort([38, 27, 43, 3, 9, 82, 10])

# Implement a method merge_sort that sorts an Array:

def subsets(arr)
	return [[]] if arr.empty? 
	previous_level = subsets(arr[0...-1])
	next_level = previous_level.map(&:dup)
	next_level.each { |ele| ele << arr[-1]}
	previous_level + next_level
end

# Array Subsets
# Write a method subsets that will return all subsets of an array.

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# Permutations
# Write a recursive method permutations(array) that calculates all the permutations of the given array. For an array of length n there are n! different permutations. So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.


def permutations(arr)
	return arr if arr.length <= 1
	output = []
	arr.each_with_index do |num, i|
		clone = arr.dup
		excluded = clone[i]
		clone.delete_at(i)
		
		permutations(clone).each do |permutation|
			new_perm = [*permutation] << excluded
			output << new_perm
		end

	end
	output
end
# p permutations([1])
# [1]
#  permutations([1,2])
# [[1,2]
# [2,1]]

#p permutations([1, 2, 3])
# # => [[1, 2, 3], [1, 3, 2],
# #     [2, 1, 3], [2, 3, 1],
# #     [3, 1, 2], [3, 2, 1]]

# Make Change
# RubyQuiz: Make change.

def make_change(num, coins = [25,10,5,1])
    return [] if num == 0

    output = []
    remainder = nil
    (0...coins.length).each do |i| 
        num_coins = num / coins[i]
        if num_coins > 0
            remainder = num % coins[i]
            num_coins.times {output << coins[i]} 
            break
        end
    end
    output + make_change(remainder, coins)
end

def make_better_change(num, coins = [25,10,5,1])
    return [] if num == 0
    return [] if coins.empty?

    best_solution = []
    remainder = nil
    (0...coins.length).each do |i|
        solution = [] 
        remainder = num - coins[i]
        if remainder >= 0
            solution << coins[i]
            solution += make_better_change(remainder, coins[i..-1])
            p solution
            if best_solution.empty?
                best_solution = solution
            end
            if solution.length < best_solution.length
                best_solution = solution
            end
        end
    end
    best_solution
end

p make_better_change(24, [10,7,1])
# Here's a game plan for solving the problem:

# First, write a 'greedy' version called greedy_make_change:

# Take as many of the biggest coin as possible and add them to your result.
# Add to the result by recursively calling your method on the remaining amount, leaving out the biggest coin, until the remainder is zero.
# Once you have a working greedy version, talk with your partner about refactoring this to make_better_change. What's wrong with greedy_make_change?

# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes as many 10 pieces as possible, greedy_make_change misses the correct answer of [10,7,7] (try it in pry).

# To make_better_change, we only take one coin at a time and never rule out denominations that we've already used. This allows each coin to be available each time we get a new remainder. By iterating over the denominations and continuing to search for the best change, we assure that we test for 'non-greedy' uses of each denomination.

# Discuss the following game plan and then work together to implement your new method:

# Iterate over each coin.
# Grab only one of that one coin and recursively call make_better_change on the remainder using coins less than or equal to the current coin.
# Add the single coin to the change returned by the recursive call. This will be a possible solution, but maybe not the best one.
# Keep track of the best solution and return it at the end.
# N.B. Don't generate every possible permutation of coins and then compare them. Remember that a permutation is not the same thing as a combination - we will need to check every combination of coins that add up to our target, we just don't want to check the same combination in different orders. If you get stuck you can start by writing a solution that calculates and compares all of the permutations without storing them in an array. Then go back and refactor your solution so that it only calculates and compares all of the different combinations. If you and your partner get totally stuck, or would like to compare your answer, feel free to reference this video walkthrough of the problem.

# Make sure you and your partner understand each line before moving on.