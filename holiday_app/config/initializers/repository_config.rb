ActiveRecord::Base.establish_connection(adapter: "sqlite3",
    database: "db/holiday_development.sqlite3")

Holiday::HolidayRepository.instance = Holiday::ActiveRecordHolidayRepository.new
Holiday::EmployeeRepository.instance = Holiday::ActiveRecordEmployeeRepository.new
