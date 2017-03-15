class AddDriverRefToDriverprofiles < ActiveRecord::Migration
  def change
    add_reference :driverprofiles, :driver, index: true
  end
end
