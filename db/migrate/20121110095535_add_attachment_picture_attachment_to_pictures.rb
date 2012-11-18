class AddAttachmentPictureAttachmentToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.has_attached_file :picture_attachment
    end
  end

  def self.down
    drop_attached_file :pictures, :picture_attachment
  end
end
