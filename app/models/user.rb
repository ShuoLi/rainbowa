class User < ActiveRecord::Base
  attr_accessible :email
  
  has_many :follows
  has_many :records
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end
  
end