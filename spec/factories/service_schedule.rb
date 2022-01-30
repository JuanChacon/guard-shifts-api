FactoryBot.define do
  factory :service_schedule do
    service_id nil
    availability_date DateTime.current
  end
end