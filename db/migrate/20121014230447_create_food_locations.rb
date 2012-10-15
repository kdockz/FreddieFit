class CreateFoodLocations < ActiveRecord::Migration
  def change
    create_table :food_locations do |t|
      t.integer :food_id
      t.integer :location_id
      t.date :date

      t.timestamps
    end
  end
end
