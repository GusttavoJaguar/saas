class Store < ApplicationRecord
  
  belongs_to :user
  has_many :photos, dependent: :destroy
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
