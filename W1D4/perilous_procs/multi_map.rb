=begin
Write a method multi_map that accepts an array, an optional number (n), and a block as arguments. 
The method should return a new array where each element of the original array is repeatedly run through the block n times. 
If the number argument is not passed in, then the the elements should be run through the block once.
=end

def multi_map(arr, n=1, &prc)
  new_arr = []
  arr.each do |ele|
    n.times {ele = prc.call(ele)} # set ele = prc.call(ele) to save the mutated el. wrat in n.times to do more than once. 
    new_arr <<ele # after every iteration shovel into new_arr
  end
  new_arr
end

p multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}      # ["pretty!", "cool!", "huh?!"]
p multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}   # ["pretty!", "cool!", "huh?!"]
p multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}   # ["pretty!!!", "cool!!!", "huh?!!!"]
p multi_map([4, 3, 2, 7], 1) { |num| num * 10 }             # [40, 30, 20, 70]
p multi_map([4, 3, 2, 7], 2) { |num| num * 10 }             # [400, 300, 200, 700]
p multi_map([4, 3, 2, 7], 4) { |num| num * 10 }             # [40000, 30000, 20000, 70000]

