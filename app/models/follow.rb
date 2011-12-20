class Follow < ActiveRecord::Base
  
  belongs_to :timeline
  belongs_to :user
end
