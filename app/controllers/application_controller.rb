class ApplicationController < ActionController::Base
	
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Add a helper method to your controllers to indicate if x-editable should be enabled.

end
