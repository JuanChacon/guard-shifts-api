class Employee < ActiveRecord::Base
   include ValidateNameConcern

   has_many :employee_schedules
   #attr color esta en hex, se guarda sin el simbolo #
end
