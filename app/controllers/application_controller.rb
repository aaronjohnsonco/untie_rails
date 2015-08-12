class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	
  use_growlyflash # except: %i[actions without growlyflash]
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Add a helper method to your controllers to indicate if x-editable should be enabled.

  def after_sign_in_path_for(resource)
 		dashboard_path
	end

	def after_sign_out_path_for(resource)
 		new_user_session_path
	end

	protected

	def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :name, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
  end

end
