class CreateHolidayRequests < ActiveRecord::Migration
  def change
    create_table :holiday_requests do |t|
      t.string :email
      t.date :starts_on
      t.date :ends_on
    end
  end
end