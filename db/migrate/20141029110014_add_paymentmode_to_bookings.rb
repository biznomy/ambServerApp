class AddPaymentmodeToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :paymentmode, :integer
  end
end
