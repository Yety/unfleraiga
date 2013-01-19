class Picture < ActiveRecord::Base
  attr_accessible :album_id, :text_body, :title, :user_id, :picture_attachment, :hidden
  
  belongs_to :album
  belongs_to :user
  
  has_attached_file :picture_attachment, :styles => {:album => "800x800", :medium => "300x300>", :thumb => "100x100>" }
  
  def next
    album.pictures.where("id > ?", id).first
  end

  def previous
    album.pictures.where("id < ?", id).last
  end

  def exif_data
    return EXIFR::JPEG.new(picture_attachment.path)
  end
end
