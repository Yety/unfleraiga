class Album < ActiveRecord::Base
  attr_accessible :text_body, :title, :user_id
  
  has_many :pictures, :order => 'id ASC'
  accepts_nested_attributes_for :pictures, :allow_destroy => true
end
