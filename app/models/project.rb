class Project < ActiveRecord::Base

	acts_as_votable

	has_many :project_attachments, dependent: :destroy
    accepts_nested_attributes_for :project_attachments

	extend FriendlyId
  		friendly_id :title, use: :slugged

	belongs_to :user

	def picture_file_type
		Project_Attachments.picture
	end

	#Validations
	validates :title, presence: true
	validates :size, presence: true
	validates :project_type, presence: true
	validates :year_finished, presence: true,
		  inclusion: { in: 1900..Date.today.year },
		  format: { 
		    with: /(19|20)\d{2}/i, 
		    message: "should be a four-digit year"
		  }
end
