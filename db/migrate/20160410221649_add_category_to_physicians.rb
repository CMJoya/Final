class AddCategoryToPhysicians < ActiveRecord::Migration
  def change
    add_column :physicians, :category_id, :integer
  end
end
