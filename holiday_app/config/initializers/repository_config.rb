ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "db/holiday_development")

Holiday::HolidayRepository.instance = Holiday::ActiveRecordHolidayRepository.new
