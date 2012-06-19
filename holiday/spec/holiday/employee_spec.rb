require 'spec_helper'

describe Employee do
  it "requires an id and an email address" do
    Employee.new("foo@example.com").email.should == "foo@example.com"
  end

  it "can have an id" do
    employee = Employee.new("foo@example.com")
    employee.id = 53
    employee.id.should == 53
  end
end
