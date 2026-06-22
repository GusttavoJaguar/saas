class Contact < ApplicationRecord
  belongs_to :store

  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

  validates :name, :email, :phone, :message, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }
end
