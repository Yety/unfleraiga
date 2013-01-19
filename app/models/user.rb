class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :encrypted_password
  attr_accessible :description, :email, :name, :password, :authenticated_by
  
  has_many :albums
  has_many :pictures
  
  def admin?
    return admin
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    picture_url = access_token[:extra][:raw_info][:picture]
    unless user
      user = User.create(name: data["name"],
                         email: data["email"],
                         authenticated_by: "google_oauth2",
                         password: Devise.friendly_token[0,20]
      )
    end
    user.picture_url=picture_url
    user
  end
end
