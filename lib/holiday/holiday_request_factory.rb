module HolidayRequestFactory
  extend self
  def build(employee, date)
    HolidayRequest.new(employee, date)
  end
end