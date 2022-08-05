require 'date'
require_relative "./item.rb"

class List

    attr_reader :label, :items

    def initialize(label)
        @label = label
        @items = []
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, description="")
        @items << Item.new(title, deadline, description)
        return true
    rescue ArgumentError
        puts "Invalid deadline"
        return false
    end

    def size
        return @items.length
    end

    def valid_index?(idx)
        valid = (0...@items.length).to_a
        valid.include?(idx)
    end

    def swap(idx_1, idx_2)
        if valid_index?(idx_1) && valid_index?(idx_2)
            @items[idx_1], @items[idx_2] = @items[idx_2], @items[idx_1]
            return true
        end
        return false
    end

    def [](idx)
        valid_index?(idx) ? @items[idx] : nil
    end

    def priority
        return @items[0]
    end

    def print
        @items.each_with_index {|ele, i| puts "Index: #{i} Item: #{@items[i].title} Deadline: #{@items[i].deadline}"}
    end

    def print_full_item(idx)
        valid_index?(idx) ? (puts "Item: #{@items[idx].title} Deadline: #{@items[idx].deadline} Description: #{@items[idx].description}") : (puts "Not a valid idx")
    end

    def print_priority
        puts "Item: #{@items[0].title} Deadline: #{@items[0].deadline} Description: #{@items[0].description}"
    end

    def up(idx, amount) 
        new_idx = idx - amount
        if valid_index?(idx)
            new_idx = 0 if new_idx < 1
            (idx).downto(new_idx).each_with_index do |ci, pi|
                
            end
        else
            return false
        end
    end
end

test = List.new("test")
test.add_item("a","2000-10-10")
test.add_item("b","1900-12-23","boo")
test.add_item("c","1994-05-15","coocoo")
test.add_item("d","1823-08-25","immortal?")

test.print_priority