require 'spec_helper'

describe EmployeeRepository do
  subject { EmployeeRepository.new }

  after(:each) do
    EmployeeRepository.instance = nil
  end

  it "adds employees" do
    employee = Employee.new("foo@example.com")
    subject.add(employee)
    subject.all_employees.should == [employee]
  end

  it "sets an id on a newly saved employee" do
    employee = Employee.new("foo@example.com")
    subject.add(employee)
    employee.id.should == 1
  end

  it "gets individual employees by id" do
    employee = Employee.new("foo@example.com")
    subject.add(employee)
    subject.get(1).should == employee
  end
end
