class Album < ActiveRecord::Base
  attr_accessible :text_body, :title, :user_id, :hidden
  
  has_many :pictures, :order => 'id ASC'
  belongs_to :user
  accepts_nested_attributes_for :pictures, :allow_destroy => true
end
