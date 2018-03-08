class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_current_user 
  include ApplicationHelper
  if :devise_controller?
    before_action :configure_permitted_parameters
  end  


  def set_current_user
    Match.current_user = current_user
    Match.current_user_is_matched = false
  end

  protected

  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :image, :bio, :college_location, :major, :academic_year, :interest_list, :password, :current_password])
  end

  

end
