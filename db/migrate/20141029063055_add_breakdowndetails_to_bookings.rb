class AddBreakdowndetailsToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :breakdowndetails, :string
  end
end
