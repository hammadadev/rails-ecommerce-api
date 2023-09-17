class Api::V1::RegistrationsController < ApplicationController
  def signup 
    puts "INSIDE METHOD SIGNUP AND THE PARAMS ARE #{params}"
  end










  private

  def registration_params
    params.require(:registration).permit(:firstname, :lastname, 
                                          :username, :email, :password, :password_confirmation)
  end
end
