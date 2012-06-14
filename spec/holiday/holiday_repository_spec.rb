require 'spec_helper'

describe HolidayRepository do
  subject { HolidayRepository.new }

  it "adds holiday requests" do
    request1 = stub
    request2 = stub
    subject.add(request1)
    subject.all_holidays.should == [request1]
  end
end
