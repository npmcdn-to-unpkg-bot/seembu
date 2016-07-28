module ProjectsHelper

	def full_name
		@project.user.profile.fname + " " + @project.user.profile.lname
	end

end
