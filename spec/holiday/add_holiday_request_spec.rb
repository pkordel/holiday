require 'spec_helper'

describe AddHolidayRequest do
  it "adds a holiday request" do
    repository = stub
    employee = stub
    date = stub
    holiday_request = stub

    HolidayRequestFactory.stub(:build).with(employee, date).and_return(holiday_request)
    repository.should_receive(:add).with(holiday_request)
    AddHolidayRequest.new(repository).call(employee, date)
  end
end
