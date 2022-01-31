class EmployeeSerializer < ActiveModel::Serializer
  cache key: 'employee', expires_in: 2.hours
  attributes :id, :name
  attribute :errors, if: :errors?


  def errors?
    object.errors.any?
   end
end
