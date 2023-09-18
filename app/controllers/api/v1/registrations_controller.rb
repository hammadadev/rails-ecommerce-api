class Api::V1::RegistrationsController < ApplicationController

  include JsonWebToken

  def signup 
    @user = User.new(registration_params)
    if @user.valid?
      @user.save
      @token = encode_token(@user.id)
      render status: 201
    else
      @error = @user
      render 'api/v1/shared/errors/validation', status: 401
    end
  end




  private

  def registration_params
    params.permit(:firstname, :lastname, :username, :email, :password, :password_confirmation)
  end

  def encode_token(user_id)
    jwt_encode(user_id: user_id)
  end
end
