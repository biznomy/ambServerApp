class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :one
      t.string :two
      t.string :zip_code

      t.timestamps
    end
  end
end
