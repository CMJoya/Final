class CreateProfessionals < ActiveRecord::Migration
  def change
    create_table :professionals do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.string :email, null: false
      t.text :bio, null: false
      t.integer :profession_id, null: false
      t.float :average_rating, default: 0.0

      t.timestamps null: false
    end
  end
end
