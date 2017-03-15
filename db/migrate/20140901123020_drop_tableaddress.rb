class DropTableaddress < ActiveRecord::Migration
  def change
  	drop_table :addresses
  	
  end
end
