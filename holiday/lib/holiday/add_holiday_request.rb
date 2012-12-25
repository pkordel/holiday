module Holiday
  class AddHolidayRequest
    # Should this take an employee ID and instantiate it?
    def call(employee_id, start_date, end_date)
      employee = EmployeeRepository.get(employee_id)
      holiday_request = HolidayRequest.build(employee, start_date, end_date)
      HolidayRepository.add(holiday_request) if holiday_request.valid?

      # Do we want to return something other than just an array of errors?
      holiday_request.errors.full_messages
    end
  end
end
