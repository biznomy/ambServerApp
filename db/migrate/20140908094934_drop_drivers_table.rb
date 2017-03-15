class DropDriversTable < ActiveRecord::Migration
  def change
  	drop_table :drivers
  end
end
