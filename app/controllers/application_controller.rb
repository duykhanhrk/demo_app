class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render_error_response status: :not_found,
                          error_code: ERROR_CODES[:NOT_FOUND],
                          message: exception.message
  end

  rescue_from StandardError do |exception|
    render_error_response status: :internal_server_error,
                          error_code: ERROR_CODES[:SERVER_ERROR],
                          message: exception.message
  end

  protected

  def render_error_response status:, error_code:, message:
    render json: { status: status, error_code: error_code, message: message },
           status: status
  end

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
    ACTION_ALREADY_TAKEN: 9,
  }
end
