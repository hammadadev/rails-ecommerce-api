class Api::V1::RegistrationsController < ApplicationController
  
  def signup 
    @user = User.new(registration_params)
    if @user.valid?
      @user.save
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
end
