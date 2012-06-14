module Holiday
  class AddHolidayRequest
    def initialize(holiday_repository)
      @holiday_repository = holiday_repository
    end

    def call(employee, start_date, end_date)
      errors = []

      if end_date < start_date
        errors << "End date must not be before start date"
      end

      @holiday_repository.add(HolidayRequest.build(employee, start_date, end_date)) if errors.empty?

      errors
    end
  end
end
