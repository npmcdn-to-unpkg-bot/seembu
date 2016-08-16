class RegistrationsController < Devise::RegistrationsController

	def new
		@user = User.new
	end

	def create
		@user = User.new(sign_up_params)	
		@user.add_role params[:user][:roles]
				

	    if @user.save
	      # UserMailer.welcome_email(@user).deliver_later
	      sign_in_and_redirect @user, :event => :authentication, notice: 'Welcome to Seembu! You have successfully signed in. You can now log in your account.'

	    else
		  render 'new', alert: 'Oh no, something went wrong. Password may be the issue or you may have the same email with somebody signed up earlier.'
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