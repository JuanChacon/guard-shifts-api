require 'rails_helper'

class ServiceTest < ActiveSupport::TestCase
  RSpec.describe Service, type: :model do
    # Association test
    # Validation test
    # ensure column name is present before saving
    it { should validate_presence_of(:name) }
  end
end
