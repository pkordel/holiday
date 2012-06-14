require 'spec_helper'

describe HolidayRequest do
  it "requires an employee and a start and end date" do
    employee = stub
    start_date = Date.today
    end_date = Date.today + 1.day
    HolidayRequest.new(employee, start_date, end_date).employee.should == employee
    HolidayRequest.new(employee, start_date, end_date).starts_on.should == start_date
    HolidayRequest.new(employee, start_date, end_date).ends_on.should == end_date
  end

  it "builds a holiday request given an and a date" do
    employee = stub
    start_date = Date.today
    end_date = Date.today + 1.day
    holiday_request = HolidayRequest.build(employee, start_date, end_date)
    holiday_request.should be_a(HolidayRequest)
  end
end
