def reverser(str, &prc)
  prc.call(str.reverse)
end

def word_changer(str, &prc)
  new_str = []
  str.split(" ").each {|word| new_str << prc.call(word)}
  new_str.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
  prc_1.call(num) > prc_2.call(num) ? prc_1.call(num) : prc_2.call(num)
end

def and_selector(arr, prc1, prc2)
  new_arr = []
  
  arr.each {|ele| new_arr << ele if prc1.call(ele) == true && prc2.call(ele) == true}

  new_arr
end

def alternating_mapper(arr, prc1, prc2) # even first : odd second
  new_arr = []

  arr.each_with_index {|ele, idx| idx % 2 == 0 ? new_arr << prc1.call(ele) : new_arr << prc2.call(ele)}

  new_arr
end