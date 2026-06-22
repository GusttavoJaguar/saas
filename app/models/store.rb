class Store < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_one_attached :logo
  has_many_attached :gallery_images
  validates :primary_color, :secondary_color, format: { with: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/, message: "deve ser uma cor hex válida" }, allow_blank: true
  validates :primary_text_color, :secondary_text_color, format: { with: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/, message: "deve ser uma cor hex válida" }, allow_blank: true

  def text_color_for(background_color)
    return "#000" unless background_color

    hex = background_color.delete("#")
    r = hex[0..1].to_i(16)
    g = hex[2..3].to_i(16)
    b = hex[4..5].to_i(16)

    brightness = (r * 299 + g * 587 + b * 114) / 1000

    brightness > 128 ? "#000000" : "#FFFFFF"
  end
end

class Store
  # returns available slot datetimes for the next `days` days with interval in minutes
  def available_slots(days: 14, interval: 30)
    slots = []
    start_date = Date.current
    (0...days).each do |d|
      date = start_date + d
      weekday = date.wday
      availabilities.where(weekday: weekday, active: true).each do |a|
        next unless a.start_time && a.end_time
        start_dt = Time.zone.local(date.year, date.month, date.day, a.start_time.hour, a.start_time.min)
        end_dt = Time.zone.local(date.year, date.month, date.day, a.end_time.hour, a.end_time.min)
        t = start_dt
        while t < end_dt
          unless bookings.exists?(scheduled_at: t)
            slots << t
          end
          t += interval.minutes
        end
      end
    end
    slots
  end
end
