class User < ActiveRecord::Base
  attr_accessible :description, :email, :name, :password
  
  has_many :albums
end
