require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Holiday::ActiveRecordHolidayRepository do
  it "adds holiday requests" do
    request = stub(:employee => stub(:email => "foo@example.com"), :starts_on => Date.today, :ends_on => Date.tomorrow)
    subject.add(request)
    subject.all_holiday_requests.size.should == 1
  end
end
