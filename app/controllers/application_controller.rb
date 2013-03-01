class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
  	#Took away '!' in User.find_by_auth_token call, was giving errors if record not found
    #debugger
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token] && User.find_by_auth_token(cookies[:auth_token])
  end
  helper_method :current_user
end
