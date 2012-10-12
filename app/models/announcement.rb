class Announcement < ActiveRecord::Base
  attr_accessible :title, :date, :description, :classification
end
