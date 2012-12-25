module Holiday
  class HolidayRequest
    include ActiveModel::Validations
    
    attr_reader :employee, :starts_on, :ends_on
    
    validates_presence_of :employee
    validates_presence_of :starts_on
    validates_presence_of :ends_on
    validate :starts_on_must_be_before_ends_on

    def initialize(employee, start_date, end_date)
      @employee = employee
      @starts_on = start_date
      @ends_on = end_date
    end

    def self.build(employee, start_date, end_date)
      HolidayRequest.new(employee, start_date, end_date)
    end
    
    private
    def starts_on_must_be_before_ends_on
      if starts_on > ends_on
        errors.add(:base, "A holiday can't end before it starts")
      end
    end
  end
end
