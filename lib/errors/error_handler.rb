module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from ActiveRecord::RecordNotFound do |e|
          render_error_response status: :not_found,
                                error_code: ERROR_CODES[:NOT_FOUND],
                                message: e.message
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          render_error_response status: :unprocessable_entity,
                                error_code: ERROR_CODES[:INVALID_CALL],
                                message: e.message
        end

        rescue_from ActionController::ParameterMissing do |e|
          render_error_response status: :unprocessable_entity,
                                error_code: ERROR_CODES[:MISSING_PARAMETER],
                                message: e.message
        end

        rescue_from StandardError do |e|
          render_error_response status: :internal_server_error,
                                error_code: ERROR_CODES[:MISSING_PARAMETER],
                                message: e.message
        end
      end
    end

    private

    ERROR_CODES = {
      UNAUTHORIZED: 0,
      MISSING_PARAMETER: 1,
      NOT_FOUND: 2,
      SERVER_ERROR: 3,
      DATA_EXISTED: 4,
      INVALID_CALL: 5,
      PERMISSION_DENIED: 6,
      UNKNOWN: 7,
      INVALID_ACCOUNT: 8,
      ACTION_ALREADY_TAKEN: 9
    }

    def render_error_response status:, error_code:, message:
      render json: { status: false, error_code: error_code, message: message },
             status: status
    end
  end
end
