#require_relative './Manager.rb'

class Employee

    attr_reader :salary

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title 
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier 
    end 

end



# # Ned = Manager.new("Ned", "Founder", 1000000, nil, ["Darren", "Shawna", "David"])
# # Darren = Manager.new("Darren", "TA Manager", 78000, "Ned", ["Shawna", "David"])
# Shawna = Employee.new("Shawna", "TA", 12000, "Darren")
# David = Employee.new("David", "TA", 10000, "Darren")

# p ned.bonus(5) # => 500_000
# p darren.bonus(4) # => 88_000
# p david.bonus(3) # => 30_000