class RegistrationsController < Devise::RegistrationsController

	def new
		@user = User.new
		@user.add_role :Client
	end

	def professional_register
		@user = User.new
		@user.add_role :Professional
	end

	def choose
	end

	def create
		@user = User.new(sign_up_params)

		if @user.username.blank?
	   		@user.add_role :Professional
	    elsif @user.firmname.blank?
	   		@user.add_role :Client
	   	else
	   		render 'choose', alert: "Don't go fishy now."
	   	end

	    if @user.save

	      # UserMailer.welcome_email(@user).deliver_later
	      sign_in_and_redirect @user, :event => :authentication, notice: 'Welcome to Seembu! You have successfully signed in. You can now log in your account.'

	    else
	    	if @user.has_role? :Client
				render 'new', alert: 'Oh no, something went wrong. Password may be the issue or you may have the same email with somebody signed up earlier.'
			elsif @user.has_role? :Professional
				render 'professional_register', alert: 'Oh no, something went wrong. Password may be the issue or you may have the same email with somebody signed up earlier.'
			end
	    end

	end

  private

  def sign_up_params
    params.require(:user).permit(:email, :firmname, :username, :password, :password_confirmation, role_ids: [])
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end

end