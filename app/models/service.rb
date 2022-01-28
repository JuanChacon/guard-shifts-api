# frozen_string_literal: true

class Service < ActiveRecord::Base
  include ValidateNameConcern
  has_many :service_schedules
end
