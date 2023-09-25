module AuthenticateHelpers
include JsonWebToken
  def authenticate_user
    token = request.headers["Authorization"]
    token = token.split(" ")[1] if !token.nil?
    begin
      decode = jwt_decode(token)
      @current_user = User.find(decode[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {errors: e.message}, status: 401
    rescue JWT::DecodeError => e
      render json: {errors: e.message}, status: 401  
    end
  end  

  def current_user
    @current_user
  end
end