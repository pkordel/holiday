require 'spec_helper'

describe Employee do
  it "requires an email address" do
    Employee.new("foo@example.com").email.should == "foo@example.com"
  end
end
