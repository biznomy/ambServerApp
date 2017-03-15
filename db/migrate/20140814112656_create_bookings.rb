class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.string :f_add
      t.string :e_add

      t.timestamps
    end
  end
end
