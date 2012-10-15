class CreateUserFoods < ActiveRecord::Migration
  def change
    create_table :user_foods do |t|
      t.integer :user_id
      t.integer :food_id
      t.date :date

      t.timestamps
    end
  end
end
