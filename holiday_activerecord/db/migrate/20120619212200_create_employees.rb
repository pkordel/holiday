class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :email
    end

    add_column :holiday_requests, :employee_id, :integer
    remove_column :holiday_requests, :email
  end
end