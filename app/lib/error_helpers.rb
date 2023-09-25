module ErrorHelpers
  extend ActiveSupport::Concern
  included do
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    def render_not_found_response
      render json: { error: "Not Found" }, status: 404
    end

    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.messages }, status: 422
    end
  end
end