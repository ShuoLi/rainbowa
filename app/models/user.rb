class User < ActiveRecord::Base
  attr_accessible :email
  
  has_many :follows
  has_many :records
end
