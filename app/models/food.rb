class Food < ActiveRecord::Base
  attr_accessible :name, :description, :food_type, :calories, :cost

  has_many :food_locations
  has_many :favorite_foods

  FOOD_TYPES = [['None', 0], ['FIT', 1], ['VEGAN', 2], ['FIT VEGAN', 3]]
  LOCATIONS = [['PHO I', 0], ['PHO II', 1], ['PHO III', 2], ['PHO IV', 3], ['8K', 4]]

  def show_food_type
  	unless self.food_type.nil? then 
      return FOOD_TYPES[self.food_type][0]
    end
  end
end
