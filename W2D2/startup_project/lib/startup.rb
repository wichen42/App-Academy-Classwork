require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salary_hash) # salary_hash = {title(str) => salary(num)}
        @name = name
        @funding = funding
        @salaries = salary_hash
        @employees = []
    end

    def valid_title?(str)
        @salaries.include?(str)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(name, title)
        unless valid_title?(title)
            raise ArgumentError.new "title is not valid"
        end
        @employees << Employee.new(name, title)
    end

    def size
        return @employees.length
    end

    def pay_employee(employee)
        unless @funding > @salaries[employee.title]
            raise ArgumentError.new "not enough funding"
        end
        employee.pay(@salaries[employee.title])
        @funding = @funding - @salaries[employee.title]
    end

    def payday
        employees.each {|e| pay_employee(e)}
    end

    def average_salary
        arr = []
        @employees.each do |employee|
            arr << @salaries[employee.title]
        end
        return arr.sum / arr.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |pos, sal|
            if !valid_title?(pos)
                @salaries[pos] = sal
            end
        end
        @employees+= startup.employees
        startup.close
    end

end
