class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private 
  def after_sign_in_path_for(resource)
    user_events_path(current_user)
  end
 
  def after_sign_out_path_for(resource)
    root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image])
  end
  
end
