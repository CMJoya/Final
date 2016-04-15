class Category < ActiveRecord::Base
  has_many :physicians
  has_many :attorneys
end
