class Booking < ApplicationRecord
  belongs_to :store

  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

  validates :name, :email, :phone, :scheduled_at, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :status, inclusion: { in: %w[pending confirmed canceled], allow_blank: true }
end
