class Event < ActiveRecord::Base
  attr_accessible :time, :video, :description
  
  belongs_to :timeline
  has_many :records
end
