module ControllerSpecHelpers

  def authenticate user
    "Bearer #{JsonWebToken.jwt_encode(user_id: user.id)}"
  end

end