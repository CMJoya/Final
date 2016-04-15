class FinalPhoto < ActiveRecord::Migration
  def change
    add_column :attorneys, :photo_id, :string
  end
end
