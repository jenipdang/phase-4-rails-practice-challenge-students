class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :cannot_process
  
    private
  
    def render_not_found_response(exception)
      render json: { error: "#{exception.model} not found" }, status: :not_found
    end
  
    def cannot_process(invalid)
      render json: { errors: [invalid.record.errors ]}, status: :unprocessable_entity
    end
end
