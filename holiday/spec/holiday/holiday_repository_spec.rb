require 'spec_helper'

describe HolidayRepository do
  subject { HolidayRepository.new }

  it "adds holiday requests" do
    request = stub
    subject.add(request)
    subject.all_holiday_requests.should == [request]
  end
end
