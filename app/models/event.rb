class Event < ActiveRecord::Base
  attr_accessible :timeline_id, :time, :video, :description
  
  belongs_to :timeline
  has_many :records
  
  default_scope :order => 'events.time DESC'
  
end
