class Physician < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_attached_file :physician_img, styles: { physician_index: "250x350>", physician_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :physician_img, content_type: /\Aimage\/.*\Z/
end
