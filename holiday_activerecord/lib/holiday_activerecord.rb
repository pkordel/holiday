require 'active_record'
require 'holiday'
require 'employee_activerecord'

module Holiday
  class ActiveRecordHolidayRepository
    def self.migrate
      ActiveRecord::Migrator.migrate(File.expand_path(__dir__ + "/../db/migrate/"))
    end

    def all_holiday_requests
      HolidayRequestRecord.all.map do |ar_holiday_request|
        employee = EmployeeRecord.find(ar_holiday_request.employee_id)
        Holiday::HolidayRequest.build(employee, ar_holiday_request.starts_on, ar_holiday_request.ends_on)
      end
    end

    def add(holiday_request)
      HolidayRequestRecord.create(:employee_id => holiday_request.employee.id, :starts_on => holiday_request.starts_on, :ends_on => holiday_request.ends_on)
    end
  end

  class HolidayRequestRecord < ::ActiveRecord::Base
    self.table_name = "holiday_requests"
  end
end
