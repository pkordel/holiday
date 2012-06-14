require 'spec_helper'

describe HolidayRequestFactory do
  it "returns a holiday request given an and a date" do
    employee = stub
    date = Date.today
    holiday_request = HolidayRequestFactory.build(employee, date)
    holiday_request.should be_a(HolidayRequest)
  end
end
