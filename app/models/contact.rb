class Contact

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :content, :reason, :number, :sender_email, :profile_name

  validates :name,
    presence: true

  validates :reason,
    presence: true

  validates :number, presence: true,
    format: {
      with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/,
      message: "Philippine standards at the moment."
    }

  validates :content,
    presence: true

end