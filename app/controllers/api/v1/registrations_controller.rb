class Api::V1::RegistrationsController < ApplicationController
  skip_before_action :authenticate_user, only: [:signup, :login]

  include JsonWebToken

  def signup 
    @user = User.create!(signup_params)
      @token = encode_token(@user.id)
  end

  def login
    @user = User.find_by_username_email(login_params[:email_or_username]).take
    if @user&.authenticate(login_params[:password])
      @token = encode_token(@user.id)
      render 'api/v1/registrations/signup', status: 200
    else
      render json: { error: 'unauthorized' }, status: 401
    end   
  end




  private

  def signup_params
    params.permit(:firstname, :lastname, :username, :email, :password, :password_confirmation)
  end

  def login_params
    params.permit(:email_or_username, :password)
  end

  def encode_token(user_id)
    jwt_encode(user_id: user_id)
  end
end
