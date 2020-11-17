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
        queue = self.employees

        while queue.empty? == false
            current = queue.shift
            total += current.salary
            queue += current.employees if current.is_a?(Manager) && current.employees != nil
        end
        
        total * multiplier
    end
end
ned = Manager.new('ned', 'founder', 1000000, nil)
darren = Manager.new("darren", "TA Manager", 78000, ned)
shawna = Employee.new("shawna", "TA", 12000, darren)
david = Employee.new("david", "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000