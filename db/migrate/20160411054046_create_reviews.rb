class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :professional_id, null: false
      t.integer :rating
      t.text :comment

      t.timestamps null: false
    end
  end
end
