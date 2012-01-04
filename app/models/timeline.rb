class Timeline < ActiveRecord::Base
  attr_accessible :subject, :description, :photo, :background, :follow_count
  
  has_many :records
  has_many :events
  has_many :follows
end
