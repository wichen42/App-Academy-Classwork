require "byebug"
class Array
    # testing Yx
    # testing wc
   

    def my_each(&prc) # {|num| p num end.my_each}
        count = 0
        while count < self.length
            prc.call(self[count])
            count+=1
        end
        return self
    end


    def my_select(&prc)
        arr = []
        self.my_each {|ele| arr << ele if prc.call(ele)}
        return arr
    end

    def my_reject(&prc)
        arr = []
        self.my_each {|ele| arr << ele if !prc.call(ele)}
        return arr
    end

    def my_any?(&prc)
        self.my_each {|ele| return true if prc.call(ele)}
        return false
    end

    def my_all?(&prc)
        count = 0
        self.my_each {|ele| count+=1 if prc.call(ele)}
        count == self.length ? true : false
    end

    def my_flatten
        #debugger
        return [self] if !self.is_a?(Array) # base case
        arr = []
        self.my_each do |ele|
            if ele.is_a?(Array) 
                arr = arr + ele.my_flatten
            else
                arr << ele
            end
        end
        return arr 
    end

    def my_zip(*arr)
        #final_arr = []
        #final_arr << self
        #arr.each {|sub| final_arr << sub}
        #p final_arr
        
        final_arr = []
        self.each_with_index do |ele, idx|
            sub = []
            sub << ele
            arr.each do |ele_2|
                if !ele_2.nil?
                    sub << ele_2[idx]
                else
                    sub << nil
                end
            end
            final_arr << sub
        end
        return final_arr
    end

    def my_rotate(n=1)
        temp = self
        if n < 0
            n.abs.times do 
                
            end
        elsif n > 0

        end
        return temp
    end 
    

end
a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
puts
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
puts
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
puts
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]