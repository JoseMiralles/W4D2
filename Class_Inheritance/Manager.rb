require_relative "employee"

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @employees = []
    end

    def add_employee(employee)
        self.employees << employee
    end

    def bonus(multiplier)
        total = 0
        
        @employees.each do |employee|
            total += employee.bonus(multiplier)
        end
        total * multiplier
    end
end
ned = Manager.new('ned', 'founder', 1000000, nil)
darren = Manager.new("darren", "TA Manager", 78000, ned)
shawna = Manager.new("shawna", "TA", 12000, darren)
david = Manager.new("david", "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000