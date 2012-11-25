class Album < ActiveRecord::Base
  attr_accessible :text_body, :title, :user_id, :must_be_logged_in_to_view
  
  has_many :pictures, :order => 'id ASC'
  belongs_to :user
  accepts_nested_attributes_for :pictures, :allow_destroy => true
end
