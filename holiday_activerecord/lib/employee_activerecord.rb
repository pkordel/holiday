require 'active_record'
require 'holiday'

module Holiday
  class ActiveRecordEmployeeRepository
    def all_employees
      EmployeeRecord.all.map do |ar_employee|
        instantiate_employee(ar_employee)
      end
    end

    def add(employee)
      ar_employee = EmployeeRecord.create(:email => employee.email)
      employee.id = ar_employee.id
      employee
    end

    def get(employee_id)
      instantiate_employee(EmployeeRecord.find(employee_id))
    end

    private
    def instantiate_employee(ar_employee)
      Holiday::Employee.new(ar_employee.email).tap {|e| e.id = ar_employee.id}
    end
  end

  class EmployeeRecord < ::ActiveRecord::Base
    self.table_name = "employees"
  end
end
