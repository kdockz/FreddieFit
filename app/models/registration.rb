class Registration < ActiveRecord::Base
  attr_accessible :event_id, :user_id

  # Relationships
  belongs_to :user
  belongs_to :event
  has_one :event
  
  scope :for_event, lambda { |e| where('event_id = ?', e) }
  

end
