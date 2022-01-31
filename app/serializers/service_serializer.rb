class ServiceSerializer < ActiveModel::Serializer
  cache key: 'service', expires_in: 2.hours
  attributes :id, :name
  attributes :service_schedules
  
  attribute :errors, if: :errors?


  def errors?
    object.errors.any?
   end
end
