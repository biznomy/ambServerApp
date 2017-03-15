class AddSpecialnotesToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :specialnotes, :text
  end
end
