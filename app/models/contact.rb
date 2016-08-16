class Contact

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :content, :reason, :number, :sender_email, :profile_name

  validates :name,
    presence: true

  validates :reason,
    presence: true

  validates :number,
    presence: true

  validates :content,
    presence: true

end