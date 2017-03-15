class AddServicetypeToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :servicetype, :integer
  end
end
