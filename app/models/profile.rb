class Profile < ActiveRecord::Base

	mount_uploader :avatar, AvatarUploader

	extend FriendlyId
	  friendly_id :firmname, use: :slugged

	 # User Avatar Validation
    validates_integrity_of  :avatar
    validates_processing_of :avatar

	belongs_to :user
    validates :avatar, file_size: { less_than_or_equal_to: 2.megabytes } 

    has_many :reviews, dependent: :destroy
end
