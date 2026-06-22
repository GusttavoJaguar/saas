class Availability < ApplicationRecord
  belongs_to :store
  validates :weekday, inclusion: { in: 0..6 }
  validates :start_time, :end_time, presence: true
  validate :end_after_start

  def end_after_start
    return unless start_time && end_time
    if end_time <= start_time
      errors.add(:end_time, "deve ser posterior ao horário de início")
    end
  end
end
