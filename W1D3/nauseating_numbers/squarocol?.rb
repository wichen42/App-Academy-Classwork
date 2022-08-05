=begin
Write a method squarocol? that accepts a 2-dimensional array as an argument. The method should return a boolean indicating whether 
or not any row or column is completely filled with the same element. You may assume that the 2-dimensional array has "square" dimensions,
meaning it's height is the same as it's width.
=end

def squarocol?(matrix)
  matrix.each_with_index do |arr, m_idx|
    #return true if all elements in a row are the same
    return true if arr.uniq.size <= 1
  end
  t_matrix = matrix.transpose # transpose to swap the rows and colums
  t_matrix.each_with_index do |arr|
    return true if arr.uniq.size <= 1
  end
  false
end

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false