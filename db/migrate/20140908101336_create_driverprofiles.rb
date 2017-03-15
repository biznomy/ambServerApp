class CreateDriverprofiles < ActiveRecord::Migration
  def change
    create_table :driverprofiles do |t|
      t.string :name

      t.timestamps
    end
  end
end
