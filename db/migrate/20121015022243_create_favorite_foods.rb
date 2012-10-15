class CreateFavoriteFoods < ActiveRecord::Migration
  def change
    create_table :favorite_foods do |t|
      t.integer :user_id
      t.integer :food_id

      t.timestamps
    end
  end
end
