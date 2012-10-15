class Food < ActiveRecord::Base
  attr_accessible :name, :description, :food_type, :calories, :cost
end
