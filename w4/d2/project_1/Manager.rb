require_relative "Employee.rb"

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss = nil, employees)
        super(name, title, salary, boss)
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



shawna = Employee.new("Shawna", "TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")
darren = Manager.new("Darren", "TA Manager", 78000, "Ned", [shawna, david])
ned = Manager.new("Ned", "Founder", 1000000, nil, [darren, shawna, david])


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
