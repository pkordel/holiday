require 'spec_helper'

describe AddHolidayRequest do
  before :each do
    @employee = stub(:email => "foo@example.com", :id => 53)
    @holiday_request = stub(:valid? => true, :errors => stub(:full_messages => []))
    @today = Date.today
    @tomorrow = Date.today + 1.day
  end

  it "adds a holiday request" do
    EmployeeRepository.stub(:get).with(@employee.id).and_return(@employee)
    HolidayRequest.stub(:build).with(@employee, @today, @tomorrow).and_return(@holiday_request)
    HolidayRepository.should_receive(:add).with(@holiday_request)
    AddHolidayRequest.new.call(@employee.id, @today, @tomorrow).should == []
  end

  it "will not add a holiday request where the holiday request is invalid" do
    @holiday_request.stub(:valid? => false)
    EmployeeRepository.stub(:get).with(@employee.id).and_return(@employee)
    HolidayRequest.stub(:build).with(@employee, @tomorrow, @today).and_return(@holiday_request)
    HolidayRepository.should_not_receive(:add)
  end
  
  it "returns the errors from the holiday request" do
    @holiday_request.errors.stub(:full_messages => ["foo"])
    EmployeeRepository.stub(:get).with(@employee.id).and_return(@employee)
    HolidayRequest.stub(:build).with(@employee, @tomorrow, @today).and_return(@holiday_request)
    AddHolidayRequest.new.call(@employee.id, @tomorrow, @today).should == ["foo"]
  end
end
