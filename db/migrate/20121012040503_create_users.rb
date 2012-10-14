class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :weight
      t.string :height
      t.date :date_of_birth
      t.string :email
      t.integer :access_level, :default => 10
      t.boolean :active, :default => true
      t.string :password_hash
      t.string :password_salt
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
