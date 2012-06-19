class HolidayRequest < OpenStruct
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def self.date_field(name)
    define_method(name) do
      parts = (1..3).to_a.map {|part| send("#{name}(#{part}i)")}
      return nil if parts.any? {|part| part.nil?}
      Date.parse(parts.join("-"))
    end
  end

  date_field :starts_on
  date_field :ends_on

  def persisted?
    false
  end
end
