# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def welcome_email_preview
  		UserMailer.welcome_email(User.first)
  	end

  	def contact_email_preview
  		UserMailer.contact_email(Profile.first)
  	end
end
