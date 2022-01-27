# frozen_string_literal: true

module API
  module Base
    extend ActiveSupport::Concern
    included do
      helpers do
        def current_user
          resource_owner
        end

        def authenticate!
          error!('401 Unauthorized', 401) unless current_user
        end

        # logger class to use to log variables or methods
        def logger
          Rails.logger
        end

        def forbidden_error
          error!('403 forbidden', 403)
        end

        def permitted_params
          @permitted_params ||= declared(params,
                                         include_missing: false)
        end
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        error_response(message: e.message, status: 404)
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        error_response(message: e.message, status: 422)
      end
    end
  end
end
