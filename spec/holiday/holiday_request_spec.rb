require 'spec_helper'

describe HolidayRequest do
  it "requires an employee and a date" do
    employee = stub
    date = Date.today
    HolidayRequest.new(employee, date).employee.should == employee
    HolidayRequest.new(employee, date).starts_on.should == date
    HolidayRequest.new(employee, date).ends_on.should == date
  end
end
