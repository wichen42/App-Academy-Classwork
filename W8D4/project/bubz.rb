def bubblesort(arr)

    # prc = Proc.new {|a,b| a<=>b }

    sorted = false
    while !sorted
        sorted = true
        (0...arr.length - 1).each do |i|
            if arr[i] > arr[i+1]
                arr[i],arr[i+1] = arr[i+1], arr[i]
                sorted = false
            end
        end
    end
    return arr
end


arrr = [1,5,2,6,32,7,3,2,2]

puts bubblesort(arrr)