module Holiday
  class HolidayRequest
    attr_reader :employee, :starts_on, :ends_on

    def initialize(employee, start_date, end_date)
      @employee = employee
      @starts_on = start_date
      @ends_on = end_date
    end

    def self.build(employee, start_date, end_date)
      HolidayRequest.new(employee, start_date, end_date)
    end
  end
end
