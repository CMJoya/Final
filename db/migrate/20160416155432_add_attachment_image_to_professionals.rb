class AddAttachmentImageToProfessionals < ActiveRecord::Migration
  def self.up
    change_table :professionals do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :professionals, :image
  end
end
