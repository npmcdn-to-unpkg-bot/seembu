class Project < ActiveRecord::Base

	acts_as_votable

	has_many :project_attachments
    accepts_nested_attributes_for :project_attachments

	extend FriendlyId
  		friendly_id :title, use: :slugged

	belongs_to :user
end
