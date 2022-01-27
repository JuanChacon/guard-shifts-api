class Employee < ActiveRecord::Base
   include ValidateNameConcern
end
