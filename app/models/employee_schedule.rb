class EmployeeSchedule < ActiveRecord::Base
  belongs_to :employee
  belongs_to :service_schedule
end
