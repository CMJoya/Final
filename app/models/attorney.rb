class Attorney < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_attached_file :attorney_img, styles: { attorney_index: "250x350>", attorney_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :attorney_img, content_type: /\Aimage\/.*\Z/
end
