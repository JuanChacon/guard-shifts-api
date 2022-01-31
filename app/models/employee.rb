class Employee < ActiveRecord::Base
   include ValidateNameConcern

   has_many :employee_schedules
end
