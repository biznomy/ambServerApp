class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :bookings, :f_add, :fadd1
  end
end
