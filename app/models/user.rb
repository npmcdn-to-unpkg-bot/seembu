class User < ActiveRecord::Base
  rolify
  #acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # after_create :send_welcome_email

  has_many :projects, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_one :profile, dependent: :destroy
    accepts_nested_attributes_for :profile
  #   before_create :create_profile

  # def create_profile
  #   if current_user.with_role(:Professional)
  #     before_create :build_profile
  #   end
  # end

  # def send_welcome_email
  #   UserMailer.welcome_email(self).deliver_later
  # end

  # Scoping
  scope :pro_profile, -> { where(:roles => { :name =>  'Professional'} ) }

  # Validations
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

end
