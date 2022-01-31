require 'test_helper'

class ServiceScheduleTest < ActiveSupport::TestCase


  # Test suite for the Personal model
  RSpec.describe ServiceSchedule, type: :model do
    # Association test
    # Validation test
    # ensure column name is present before saving
    it { should belongs_to(:service) }
    it { should validate_presence_of(:service_id) }

    # ensure has_many relationship with employee_schedules
    it { should has_many(:employee_schedules) }
  end
end


