module Holiday
  class EmployeeRepository

    class << self
      extend Forwardable

      def instance
        @instance ||= new
      end
      private :instance

      def instance=(instance)
        @instance = instance
      end

      def_delegators :instance, :add, :get, :all_employees
    end

    def initialize
      @employees = []
    end

    def add(employee)
      @employees << employee
      employee.id = @employees.size
      employee
    end

    def all_employees
      @employees
    end

    def get(id)
      @employees[id - 1]
    end
  end
end
