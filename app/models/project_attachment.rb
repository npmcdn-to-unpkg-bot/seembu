class ProjectAttachment < ActiveRecord::Base

	  mount_uploader :picture, PictureUploader

		  # User Picture Validation
	  validates_integrity_of  :picture
	  validates_processing_of :picture

	  validates :picture, file_size: { less_than_or_equal_to: 8.megabytes } 
end
