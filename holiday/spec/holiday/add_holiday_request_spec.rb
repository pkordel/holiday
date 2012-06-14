require 'spec_helper'

describe AddHolidayRequest do
  it "adds a holiday request" do
    repository = stub
    employee = stub
    start_date = stub
    end_date = stub
    holiday_request = stub

    HolidayRequest.stub(:build).with(employee, start_date, end_date).and_return(holiday_request)
    repository.should_receive(:add).with(holiday_request)
    AddHolidayRequest.new(repository).call(employee, start_date, end_date)
  end
end
