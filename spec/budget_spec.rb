require './lib/department'
require './lib/employee'
require './lib/budget'

RSpec.describe Budget do
  it "exists" do
    budget = Budget.new(2023)

    expect(budget).to be_a(Budget)
  end

  it "has a list of departments" do
    budget = Budget.new(2023)

    expect(budget.departments).to be_a(Array)
  end

  it "can add departments" do
    budget = Budget.new(2023)
    customer_service = Department.new("Customer Service")
    shipping = Department.new("Shipping")
    warehouse = Department.new("Warehouse")

    budget.add_department(customer_service)
    budget.add_department(shipping)
    budget.add_department(warehouse)
    expect(budget.departments.count).to eq(3)
  end

  it "can return low expense offices" do
    budget = Budget.new(2023)
    customer_service = Department.new("Customer Service")
    shipping = Department.new("Shipping")
    warehouse = Department.new("Warehouse")

    budget.add_department(customer_service)
    budget.add_department(shipping)
    budget.add_department(warehouse)

    expect(budget.departments_with_low_expenses).to be_a(Array)
  end

  it "can return employee salaries" do
    budget = Budget.new(2023)
    customer_service = Department.new("Customer Service")
    shipping = Department.new("Shipping")
    warehouse = Department.new("Warehouse")

    budget.add_department(customer_service)
    budget.add_department(shipping)
    budget.add_department(warehouse)


    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})
    customer_service.hire(bobbi)
    customer_service.hire(aaron)

    expect(budget.employee_salaries).to be_a(Array)
  end

  it 'can list all departments and their current expenses' do
    budget = Budget.new(2023)
    customer_service = Department.new("Customer Service")
    shipping = Department.new("Shipping")
    warehouse = Department.new("Warehouse")

    budget.add_department(customer_service)
    budget.add_department(shipping)
    budget.add_department(warehouse)
  
    expect(budget.current_expenses_by_department).to be_a(Hash)
  end

end
