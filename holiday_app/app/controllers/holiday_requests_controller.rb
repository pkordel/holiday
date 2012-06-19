class HolidayRequestsController < ApplicationController
  def index
    @holiday_requests = Holiday::HolidayRepository.all_holiday_requests
  end

  def new
    @errors = []
    @employees = Holiday::EmployeeRepository.all_employees
    @holiday_request = HolidayRequest.new
  end

  def create
    @holiday_request = HolidayRequest.new(params[:holiday_request])
    @errors = Holiday::AddHolidayRequest.new.call(@holiday_request.employee_id, @holiday_request.starts_on, @holiday_request.ends_on)

    if @errors.empty?
      redirect_to holiday_requests_path
    else
      render :new
    end
  end
end
