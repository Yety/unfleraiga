class Post < ActiveRecord::Base
  attr_accessible :body, :published, :title, :user_id

  belongs_to :user
end
