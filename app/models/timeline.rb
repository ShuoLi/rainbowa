class Timeline < ActiveRecord::Base
  attr_accessible :subject, :description, :photo, :background
  
  has_many :events
  has_many :follows
end
