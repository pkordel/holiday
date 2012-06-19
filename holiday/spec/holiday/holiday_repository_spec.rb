require 'spec_helper'

describe HolidayRepository do
  subject { HolidayRepository.new }

  after(:each) do
    HolidayRepository.instance = nil
  end

  it "adds holiday requests" do
    request = stub
    subject.add(request)
    subject.all_holiday_requests.should == [request]
  end

  it "allows for different instances" do
    new_repository = stub
    HolidayRepository.instance = new_repository
    new_repository.should_receive(:add)
    HolidayRepository.add
  end
end
