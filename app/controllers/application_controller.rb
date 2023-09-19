class ApplicationController < ActionController::API
  before_action :authenticate_user
  wrap_parameters false
  include AuthenticateHelpers
end
