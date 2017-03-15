class CreateVehicleaddons < ActiveRecord::Migration
  def change
    create_table :vehicleaddons do |t|

      t.timestamps
    end
  end
end
