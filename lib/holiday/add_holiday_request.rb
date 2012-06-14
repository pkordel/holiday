class AddHolidayRequest
  def initialize(holiday_repository)
    @holiday_repository = holiday_repository
  end

  def call(employee, start_date, end_date)
    @holiday_repository.add(HolidayRequest.build(employee, start_date, end_date))
  end
end