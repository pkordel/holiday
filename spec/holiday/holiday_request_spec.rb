require 'spec_helper'

describe HolidayRequest do
  it "requires an employee and a date" do
    employee = stub
    date = Date.today
    HolidayRequest.new(employee, date).employee.should == employee
    HolidayRequest.new(employee, date).starts_on.should == date
    HolidayRequest.new(employee, date).ends_on.should == date
  end

  it "builds a holiday request given an and a date" do
    employee = stub
    date = Date.today
    holiday_request = HolidayRequest.build(employee, date)
    holiday_request.should be_a(HolidayRequest)
  end
end
