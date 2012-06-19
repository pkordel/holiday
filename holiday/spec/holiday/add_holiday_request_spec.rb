require 'spec_helper'

describe AddHolidayRequest do
  before :each do
    @employee = stub(:email => "foo@example.com")
    @holiday_request = stub
    @today = Date.today
    @tomorrow = Date.today + 1.day
  end

  it "adds a holiday request" do
    HolidayRequest.stub(:build).with(@employee, @today, @tomorrow).and_return(@holiday_request)
    HolidayRepository.should_receive(:add).with(@holiday_request)
    AddHolidayRequest.new.call(@employee, @today, @tomorrow).should == []
  end

  it "will not add a holiday request where the end is before the start" do
    HolidayRequest.stub(:build).with(@employee, @tomorrow, @today).and_return(@holiday_request)
    HolidayRepository.should_not_receive(:add)
    AddHolidayRequest.new.call(@employee, @tomorrow, @today).should_not be_empty
  end
end
