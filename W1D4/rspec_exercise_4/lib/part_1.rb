def my_reject(arr, &prc)
  new_arr = []
  arr.each {|ele| new_arr << ele if prc.call(ele) == false}
  new_arr
end

def my_one?(arr, &prc)
  new_arr = []
  arr.each {|ele| new_arr << ele if prc.call(ele) == true}
  new_arr.length == 1
end

def hash_select(hash, &prc) # TODO: figure out how to pass v to prc without passing k
  new_hash = {}
  hash.each {|k,v| new_hash[k] = v if prc.call(k, v)}
  new_hash
end

#p hash_select({"a"=>0, "b"=>1, "c"=> 2, "o"=>14}) { |k, v| "aeiou".include?(k) }

def xor_select(arr, prc1, prc2)
  new_arr = []
  arr.each do |ele|
    if prc1.call(ele) == true && prc2.call(ele) == true
        next
    end
    if (prc1.call(ele) == true && prc2.call(ele) == false) || (prc1.call(ele) == false && prc2.call(ele) == true)
        new_arr << ele
    end
  end
  new_arr
end

def proc_count(value, prc_arr)
  count = 0
  prc_arr.each {|prc| count+=1 if prc.call(value)}
  count
end