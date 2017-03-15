class CreateBookingAddons < ActiveRecord::Migration
  def change
    create_table :booking_addons do |t|

      t.timestamps
    end
  end
end
