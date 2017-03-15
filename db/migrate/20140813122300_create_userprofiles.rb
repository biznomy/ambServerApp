class CreateUserprofiles < ActiveRecord::Migration
  def change
    create_table :userprofiles do |t|
      t.string :full_name
      t.string :medical_info
      t.string :address

      t.timestamps
    end
  end
end
