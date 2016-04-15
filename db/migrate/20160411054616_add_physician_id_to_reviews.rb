class AddPhysicianIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :physician_id, :integer
  end
end
