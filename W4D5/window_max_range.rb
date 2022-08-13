def bad_solution(arr, size)
    current_max_range = nil
    max = 0

    i = 0
    j = i + size - 1
    while j < arr.length
        sort = arr[i..j].sort
        current_max_range = sort[-1] - sort[0]
        if current_max_range > max
            max = current_max_range
        end
        i+=1
        j+=1 
    end
    return max
end

p bad_solution([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p bad_solution([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p bad_solution([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p bad_solution([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8