class CreateFoods < ActiveRecord::Migration
  def self.up
    create_table :foods do |t|
      t.string :name
      t.text :description
      t.integer :food_type
      t.integer :calories
      t.float :cost
      t.timestamps
    end
  end

  def self.down
    drop_table :foods
  end
end
