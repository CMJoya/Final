class AddProfessionFieldToProfessionals < ActiveRecord::Migration
  def change
    add_column :professionals, :profession_field, :string
  end
end
