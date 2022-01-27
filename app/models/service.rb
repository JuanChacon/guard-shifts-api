# frozen_string_literal: true

class Service < ActiveRecord::Base
  include ValidateNameConcern
end
