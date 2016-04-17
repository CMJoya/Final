class Review < ActiveRecord::Base
  validates :professional_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true

  belongs_to :professional
  belongs_to :user
end
