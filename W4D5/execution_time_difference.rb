list1 = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
    
def my_min(list)
    # min = list.first
    # list.each do |el|
    #     min = el if el < min
    # end
    #min  
    #O(n)
    min = list.first   
    (1...list.length).each do |i|
        (i+1...list.length).each do |j|
            min = list[i] if list[i] < list[j]
        end
    end
    return min
    #O(n^2)
end

list2 = [1, -7, 1, 3, -2, 5, -8, -2, 4, -5, 24]
    
def largest_contiguous_subsum(list)
    output = []
    (0...list.length).each do |i|
        (i+1...list.length).each do |j|
            output << list[i..j].sum
        end
    end
    return output.max
end

def largest_contiguous_subsum2(list)
    largest_sum = 0 # constant
    current_sum = 0 # constant
    i = 0 # constant
    firstPositive = false # constant
    while i < list.length # n 
        if list[i] > 0 # constant
            firstPositive = true # constant 
        end
        if current_sum != 0 && list[i] > 0 || firstPositive == true # constant 
            current_sum += list[i] # constant 
        end
        if current_sum > largest_sum # constant 
            largest_sum = current_sum # constant 
        end
        if list[i].abs > largest_sum # constant 
            current_sum = 0 # constant 
        end
        i += 1 # constant 
    end
    return largest_sum # constant 
end

p largest_contiguous_subsum2(list2) # => 8
