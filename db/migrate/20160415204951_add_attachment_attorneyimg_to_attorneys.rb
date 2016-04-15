class AddAttachmentAttorneyimgToAttorneys < ActiveRecord::Migration
  def self.up
    change_table :attorneys do |t|
      t.attachment :attorney_img
    end
  end

  def self.down
    remove_attachment :attorneys, :attorney_img
  end
end
