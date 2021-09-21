require "Employee.rb"

class Manager < Employee

    def initialize(employees)
        super
        @employees = employees 
    end

    def bonus(multiplier)
        sum = 0
        employees.each do |employee|
            sum += employee.salary
        end
        sum * multiplier 
    end

end


Ned = Manager.new("Ned", "Founder", 1000000, nil, ["Darren", "Shawna", "David"])
Darren = Manager.new("Darren", "TA Manager", 78000, "Ned", ["Shawna", "David"])
Shawna = Employee.new("Shawna", "TA", 12000, "Darren")
David = Employee.new("David", "TA", 10000, "Darren")

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
