class HolidayRequest
  attr_reader :employee, :starts_on, :ends_on
  def initialize(employee, date)
    @employee = employee
    @starts_on = date
    @ends_on = date
  end
end
