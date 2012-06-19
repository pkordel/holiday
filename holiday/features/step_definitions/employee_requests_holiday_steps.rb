Given /^I have no other planned holidays$/ do
  holidays = HolidayRepository.all_holiday_requests
  holidays.size.should == 0
end

When /^I request a holiday of two days in the future$/ do
  @employee = Employee.new("bob@example.com")
  @next_wednesday = Chronic.parse("next wednesday + 1")
  @next_thursday = @next_wednesday + 1.day
  AddHolidayRequest.new.call(@employee, @next_wednesday, @next_thursday)
end

Then /^that holiday request is logged$/ do
  holidays = HolidayRepository.all_holiday_requests
  holidays.size.should == 1
  holidays.first.employee.should == @employee
  holidays.first.starts_on.should == @next_wednesday
  holidays.first.ends_on.should == @next_thursday
end
