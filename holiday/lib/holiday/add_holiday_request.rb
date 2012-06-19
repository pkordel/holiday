module Holiday
  class AddHolidayRequest
    # Should this take an employee ID and instantiate it?
    def call(employee, start_date, end_date)
      errors = []

      # Do validations belong here? Should hey be in the HolidayRequest itself?
      if end_date < start_date
        errors << "End date must not be before start date"
      end

      HolidayRepository.add(HolidayRequest.build(employee, start_date, end_date)) if errors.empty?

      # Do we want to return something other than just an array of errors?
      errors
    end
  end
end
