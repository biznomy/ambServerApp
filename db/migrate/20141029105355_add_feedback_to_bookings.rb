class AddFeedbackToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :feedback, :integer
  end
end
