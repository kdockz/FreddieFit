class Event < ActiveRecord::Base
  attr_accessible :title, :description, :event_type, :location, :capacity
end
