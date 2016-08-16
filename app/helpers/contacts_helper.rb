module ContactsHelper

	def full_name_contacts
		current_user.profile.fname + " " + current_user.profile.lname
	end

end
