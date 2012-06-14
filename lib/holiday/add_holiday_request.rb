class AddHolidayRequest
  def initialize(holiday_repository)
    @holiday_repository = holiday_repository
  end

  def call(employee, date)
    @holiday_repository.add(HolidayRequest.build(employee, date))
  end
end