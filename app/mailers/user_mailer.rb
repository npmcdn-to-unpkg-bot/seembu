class UserMailer < ApplicationMailer

	  def welcome_email(user)
	  	@user = user
	  	mail(to: @user.email, subject: 'Welcome to Seembu')
	  end

	  def contact_email(contact)
	  	@contact = contact
	  	mail(to: @contact.email , subject: 'Potential Client Inquery from Seembu')
	  end

end
