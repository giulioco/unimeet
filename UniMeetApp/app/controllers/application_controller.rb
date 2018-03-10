class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_current_user_for_match
  before_action :set_user
  include ApplicationHelper
  if :devise_controller?
    before_action :configure_permitted_parameters
  end  


  def set_current_user_for_match
    Match.current_user = current_user
    Match.current_user_is_matched = false
  end

  protected

  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :cruzid, :email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:cruzid, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :image, :bio, :college_location, :major, :academic_year, :interest_list, :password, :current_password])
  end

  def update_notifications
    puts "update_notifications CALLED!!!!"
    respond_to do |format|               
      format.js
    end
  end


  private

  def set_user
    if current_user == nil
      cookies[:user_id] = 'guest'
    else
      cookies[:user_id] = current_user.id
    end
  end

  

end
