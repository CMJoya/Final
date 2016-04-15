class AddAttorneyIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :attorney_id, :integer
  end
end
