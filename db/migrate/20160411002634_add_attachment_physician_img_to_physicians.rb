class AddAttachmentPhysicianImgToPhysicians < ActiveRecord::Migration
  def self.up
    change_table :physicians do |t|
      t.attachment :physician_img
    end
  end

  def self.down
    remove_attachment :physicians, :physician_img
  end
end
