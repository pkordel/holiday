module Holiday
  class HolidayRepository
    def self.instance
      @instance ||= new
    end

    def initialize
      @holiday_requests = []
    end

    def all_holidays
      @holiday_requests
    end

    def add(holiday_request)
      @holiday_requests << holiday_request
    end
  end
end
