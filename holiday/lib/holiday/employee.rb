module Holiday
  class Employee
    attr_accessor :id
    attr_reader :email
    def initialize(email)
      @email = email
    end
  end
end
