# frozen_string_literal: true

require 'rails_helper'

class PersonalTest < ActiveSupport::TestCase
  # Test suite for the Personal model
  RSpec.describe Personal, type: :model do
    # Association test
    # Validation test
    # ensure column name is present before saving
    it { should validate_presence_of(:name) }

    # ensure has_many relationship with employee_schedules
    it { should has_many(:employee_schedules) }
  end
end
