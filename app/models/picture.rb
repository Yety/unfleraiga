class Picture < ActiveRecord::Base
  attr_accessible :album_id, :text_body, :title, :user_id, :picture_attachment
  
  belongs_to :album
  
  has_attached_file :picture_attachment, :styles => {:album => "1024x1024", :medium => "300x300>", :thumb => "100x100>" }
  
  def next
    album.pictures.where("id > ?", id).first
  end

  def previous
    album.pictures.where("id < ?", id).last
  end
end