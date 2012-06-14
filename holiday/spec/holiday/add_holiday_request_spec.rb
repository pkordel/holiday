require 'spec_helper'

describe AddHolidayRequest do
  before :each do
    @repository = stub
    @employee = stub(:email => "foo@example.com")
    @holiday_request = stub
    @today = Date.today
    @tomorrow = Date.today + 1.day
  end

  it "adds a holiday request" do
    HolidayRequest.stub(:build).with(@employee, @today, @tomorrow).and_return(@holiday_request)
    @repository.should_receive(:add).with(@holiday_request)
    AddHolidayRequest.new(@repository).call(@employee, @today, @tomorrow).should == []
  end

  it "will not add a holiday request where the end is before the start" do
    HolidayRequest.stub(:build).with(@employee, @tomorrow, @today).and_return(@holiday_request)
    @repository.should_not_receive(:add)
    AddHolidayRequest.new(@repository).call(@employee, @tomorrow, @today).should_not be_empty
  end
end
