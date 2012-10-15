class FavoriteFood < ActiveRecord::Base
  attr_accessible :food_id, :user_id

  belongs_to :user
  belongs_to :food
end
