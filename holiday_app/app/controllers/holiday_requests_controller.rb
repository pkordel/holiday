class HolidayRequestsController < ApplicationController
  def index
    @holiday_requests = Holiday::HolidayRepository.instance.all_holiday_requests
  end

  def new
    @holiday_request = HolidayRequest.new
  end

  def create
    @holiday_request = HolidayRequest.new(params[:holiday_request])
    employee = Holiday::Employee.new(@holiday_request.email)
    Holiday::AddHolidayRequest.new(Holiday::HolidayRepository.instance).call(employee, @holiday_request.starts_on, @holiday_request.ends_on)
    redirect_to holiday_requests_path
  end
end
