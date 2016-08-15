class UserMailer < ApplicationMailer

	default from: "services@seembu.com"

	  def welcome_email(user)
	  	@user = user
	  	mail(to: @user.email, subject: 'Welcome to Codeplace')
	  end

end
