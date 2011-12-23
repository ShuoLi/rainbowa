class Timeline < ActiveRecord::Base
  attr_accessible :subject, :description, :photo
  
  has_many :events
  has_many :follows
end