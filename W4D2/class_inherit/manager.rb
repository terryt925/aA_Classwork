
require_relative "employee"

class Manager < Employee

  attr_reader :employees, :salary

  def initialize(name, salary, title, boss, employees)
    super(name,title,salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    sum = 0
    self.employees.each { |employee| sum += employee.salary.to_i } #sum += employee.salary }
    sum * multiplier
  end


end #end of class


shawna = Employee.new("Shawna", 12000, "ta", "Darren")
david = Employee.new("David", 10000, "ta", "Darren")
darren = Employee.new('Darren', 78000, "ta_manager", "Ned")
ned = Manager.new("Ned", 10000000, "founder", nil, [darren])

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000