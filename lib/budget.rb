

class Budget
  attr_reader :departments, :year
  def initialize(year)
    @year = year
    @departments = []
  end

  def add_department(name)
    @departments << name
  end

  def departments_with_low_expenses
    low_expense_offices = []
    @departments.each do |department|
      if department.expenses < 500
        low_expense_offices << department
      end
    end
    low_expense_offices
  end

  def employee_salaries
    salaries = []     # derived from: budget.departments[0].employees[0].salary
    @departments.each do |department|
      department.employees.each do |employee|
        salaries << employee.salary
      end
    end
    salaries
  end

  def current_expenses_by_department
    dept_expense = {}
    @departments.each do |department|
      dept_expense[department.name] = department.expenses
    end
    dept_expense
  end
end
