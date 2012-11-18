class AddAttachmentPictureAttachmentToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.has_attached_file :picture_attachment
    end
  end

  def self.down
    drop_attached_file :posts, :picture_attachment
  end
end
