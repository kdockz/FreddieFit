class Announcement < ActiveRecord::Base
  attr_accessible :title, :date, :description, :classification

  ANNOUNCEMENT_TYPES = [['Fitness', 0], ['Food', 1]]

end
