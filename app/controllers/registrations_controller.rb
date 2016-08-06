class RegistrationsController < Devise::RegistrationsController

	def create
		@user = User.new(sign_up_params)	
		@user.add_role params[:user][:roles]
				

	    if @user.save
	      redirect_to new_user_session_path, notice: 'Welcome to Seembu! You have successfully signed in. You can now log in your account.'
	    else
		  redirect_to new_user_registration_path, alert: 'Oh no, something went wrong. Password may be the issue or you may have the same email with somebody signed up earlier.'
	    end
	end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, role_ids: [])
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
end