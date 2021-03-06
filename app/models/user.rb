class User < ActiveRecord::Base
  rolify

  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # after_create :send_welcome_email

  has_many :projects, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_one :profile, dependent: :destroy
    before_create :build_profile
    accepts_nested_attributes_for :profile

  # def send_welcome_email
  #   UserMailer.welcome_email(self).deliver_later
  # end


end
