
require_relative "employee"

class Manager < Employee

  def initialize(name,title,salary,boss,employees)
    super(name,title,salary,boss)
    @employees = []
  end

  def bonus(multiplier)
    b = self.employees.inject(0) { |acc,el| acc + el.salary}
    b * multiplier
  end


end #end of class


ned = Employee.new("Ned")