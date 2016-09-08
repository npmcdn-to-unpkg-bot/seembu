class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  	def after_sign_in_path_for(resource)
      if current_user.has_role?(:Professional)
    		if current_user.profile.fname.blank? and current_user.profile.lname.blank?
    			edit_profile_path(current_user)
    		else
    			root_path
    		end
      else
        root_path
      end
  	end

end
