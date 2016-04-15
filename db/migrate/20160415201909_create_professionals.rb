class CreateProfessionals < ActiveRecord::Migration
  def change
    create_table :professionals do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
