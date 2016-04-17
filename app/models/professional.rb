class Professional < ActiveRecord::Base
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :bio, presence: true

  has_many :reviews
  belongs_to :profession

  has_attached_file :image, styles: { image_index: "250x350>", image_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def full_name
    [first_name, last_name].join(" ")
  end

  def self.create_attorney
    profession = Profession.find_by(name: "Attorney")
    profession.professionals.new
  end

  def self.create_physician
    profession = Profession.find_by(name: "Physician")
    profession.professionals.new
  end
end
