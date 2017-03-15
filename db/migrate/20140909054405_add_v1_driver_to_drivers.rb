class AddV1DriverToDrivers < ActiveRecord::Migration
  def change
  	add_column :drivers, :authentication_token, :string
    add_column :drivers, :confirmation_token, :string
    add_column :drivers, :confirmed_at, :datetime
    add_column :drivers, :confirmation_sent_at, :datetime

add_index :drivers, :confirmation_token,   :unique => true
add_index :drivers, :authentication_token, :unique => true
  end
end
