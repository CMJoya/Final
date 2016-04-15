class AddUserIdToPhysicians < ActiveRecord::Migration
  def change
    add_column :physicians, :user_id, :integer
  end
end
