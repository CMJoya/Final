class AddPlaceIdToProfessionals < ActiveRecord::Migration
  def change
    add_column :professionals, :placeId, :string
  end
end
