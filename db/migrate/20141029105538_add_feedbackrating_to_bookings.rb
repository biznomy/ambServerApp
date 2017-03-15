class AddFeedbackratingToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :feedbackrating, :boolean, :default => true
  end
end
