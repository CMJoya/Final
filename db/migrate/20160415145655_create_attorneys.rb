class CreateAttorneys < ActiveRecord::Migration
  def change
    create_table :attorneys do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone_number
      t.string :email
      t.text :bio
      t.integer :photo_id
      t.integer :user_id
      t.integer :category_id
      t.timestamps null: false
    end
  end
end
