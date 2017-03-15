class AddBookingRefToAccounts < ActiveRecord::Migration
  def change
    add_reference :accounts, :booking, index: true
  end
end
