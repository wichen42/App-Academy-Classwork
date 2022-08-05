require 'date'

class Item

    attr_reader :deadline
    attr_accessor :title, :description

    def self.valid_date?(date_string) # yyyy-mm-dd
        year, month, day = date_string.split("-")
        Date.valid_date?(year.to_i, month.to_i, day.to_i)
    end

    def initialize(title, deadline, description)
        unless Item.valid_date?(deadline)
            raise ArgumentError.new "Invalid deadline"
        end
        @title = title
        @deadline = deadline
        @description = description
    end

    def deadline=(new_deadline)
        unless Item.valid_date?(new_deadline)
            raise ArgumentError.new "Invalid deadline"
        end
        @deadline = new_deadline
    end

end
