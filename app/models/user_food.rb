class UserFood < ActiveRecord::Base
  attr_accessible :date, :food_id, :user_id

  belongs_to :user
  belongs_to :food

end
