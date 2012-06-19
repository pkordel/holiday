module Holiday
  class HolidayRepository
    # We somehow appear to have a singleton here. Why?
    # Would it be better to have static methods which delegated to an instance?
    # This would help us lose the HolidayRepository.instance.blah
    def self.instance
      @instance ||= new
    end

    def self.instance=(instance)
      @instance = instance
    end

    def initialize
      @holiday_requests = []
    end

    def all_holiday_requests
      @holiday_requests
    end

    def add(holiday_request)
      @holiday_requests << holiday_request
    end
  end
end
