class Finalphotoedit < ActiveRecord::Migration
  def change
    remove_column :attorneys, :photo_id, :integer
  end
end
