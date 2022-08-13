def bad_two_sum?(arr, target_sum)
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum
        end
    end
    return false
end


# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum)
    sorted = arr.sort 
    i = 0
    j = arr.length-1
    while i < j 
        return true if sorted[i] + sorted[j] == target_sum
        if target_sum > sorted[j]
            i += 1
        else
            j -= 1
        end
    end
    return false
end
arr = [0, 1, 5, 7]
arr2 = [1, 6, 7, 6, 10, 9, 4]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target_sum)
    hash = Hash.new(0)
    arr.each {|ele| hash[ele] += 1} #n
    arr.each do |ele| #n
        value = target_sum - ele
        if value == ele
            return true if hash[value] > 1
        else
            return true if hash.has_key?(value)
        end
    end
    return false
end

p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

