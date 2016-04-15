class Review < ActiveRecord::Base

  belongs_to :attorney
  belongs_to :physician
  belongs_to :user
end
