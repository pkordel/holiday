module Holiday
  class HolidayRepository

    class << self
      extend Forwardable

      def instance
        @instance ||= new
      end
      private :instance

      def instance=(instance)
        @instance = instance
      end

      def_delegators :instance, :all_holiday_requests, :add
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
