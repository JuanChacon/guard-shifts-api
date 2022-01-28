class ServiceSchedule < ActiveRecord::Base
    belongs_to :service
    validates_presence_of :service_id
end
