class Tower

    attr_accessor :peg1, :peg2, :peg3
    attr_reader :num

    def initialize(num)
        raise "Invalid number" if !num.is_a?(Integer)
        @peg1 = []
            (0...num).each do |n|
                @peg1.unshift(n+1)
            end
        @peg2 = []
        @peg3 = []
        @num = num
    end

    def input
        output = gets.chomp.to_i
        return output
    end

    def move(first, second)
        p self
        puts "Choose your first peg"
        first_chosen_peg = self.pick_peg(first)

        puts "Choose your second peg"
        second_chosen_peg = pick_peg(second)

        disc = first_chosen_peg.pop
        second_chosen_peg << disc
    end

    def valid_move?(*nums)
        if nums.length == 1
            peg = pick_peg(nums[0])
        end
        #! for the first input
        #if input peg last ele is greater than last ele of other 2 pegs raise invalid
        #? for the second input
        #if input peg last ele is less than output peg's last ele
    end

    def pick_peg(user_input)
        raise ArgumentError if !user_input.is_a?(Integer)

        if user_input == 1
            return @peg1
        elsif user_input == 2
            return @peg2
        else
            return @peg3
        end
    end

    def won?
        #peg1 and peg 2 are empty? if peg 3 is sorted reverse, won!
        return false if @peg1.length > 0 || @peg2.length > 0
        if @peg3.length == @num
            @peg3 == @peg3.sort.reverse ? true : false
        end
    end
end

