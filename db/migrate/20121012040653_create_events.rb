class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :event_type
      t.string :location
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.integer :capacity
      t.integer :user_id
      t.integer :trainer_id
      t.integer :registration
      t.boolean :active
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
