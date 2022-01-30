# frozen_string_literal: true

class Service < ActiveRecord::Base
  include ValidateNameConcern
  has_many :service_schedules


  def week_schedule_by_week(week)
    today = ApplicationController.helpers.today
    service_schedules.where("strftime('%W',service_schedules.availability_date) = '#{week}' AND strftime('%Y',service_schedules.availability_date) == '#{today.strftime('%Y')}'")
  end
  
  def dates_from_week(week)
   schedules= week_schedule_by_week(week)
   schedules.any? ? "#{schedules&.first&.availability_date&.strftime('%d/%m/%Y')} al #{schedules&.last&.availability_date&.strftime('%d/%m/%Y')}" : ""
  end  

end
