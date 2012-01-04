class Record < ActiveRecord::Base
  belongs_to :timeline
  belongs_to :event
  belongs_to :user
end
