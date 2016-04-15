class FixPhysicians < ActiveRecord::Migration
  def change
    add_column :physicians, :email, :string
    add_column :physicians, :address, :string
    add_column :physicians, :phone_number, :string
  end
end
