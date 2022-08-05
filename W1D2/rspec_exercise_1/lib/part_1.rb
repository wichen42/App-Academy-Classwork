
def average(num_1, num_2)
  (num_1 + num_2) / 2.0
end

def average_array(arr) # inject to sum array. divide by length of array converted to float for avg
  arr.inject {|acc, ele| acc+ele} / arr.length.to_f
end

def repeat(str, n)
   str * n 
end

def yell(str)
  new_str = str.upcase + "!"
end

def alternating_case(sentence)
  new_sent = []
  sentence.split(" ").each_with_index do |word, idx|
    if word == word.upcase
        idx.odd? ? new_sent << word.downcase : new_sent << word
    else
        idx.even? ? new_sent << word.upcase : new_sent << word
    end
  end   
  new_sent.join(" ")
end