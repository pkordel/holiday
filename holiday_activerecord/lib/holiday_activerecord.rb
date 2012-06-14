require 'active_record'
require 'holiday'

module Holiday
  class ActiveRecordHolidayRepository
    def self.migrate
      ActiveRecord::Migrator.migrate(File.expand_path(File.dirname(__FILE__) + "/../db/migrate/"))
    end

    def all_holiday_requests
      HolidayRequestRecord.all.map do |ar_holiday_request|
        Holiday::HolidayRequest.build(Employee.new(ar_holiday_request.email), ar_holiday_request.starts_on, ar_holiday_request.ends_on)
      end
    end

    def add(holiday_request)
      HolidayRequestRecord.create(:email => holiday_request.employee.email, :starts_on => holiday_request.starts_on, :ends_on => holiday_request.ends_on)
    end
  end

  class HolidayRequestRecord < ::ActiveRecord::Base
    self.table_name = "holiday_requests"
  end
end