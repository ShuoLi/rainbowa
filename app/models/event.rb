class Event < ActiveRecord::Base
  attr_accessible :timeline_id, :time, :video, :description, :title
  
  belongs_to :timeline
  has_many :records
  
  default_scope :order => 'events.time DESC'
  
end
