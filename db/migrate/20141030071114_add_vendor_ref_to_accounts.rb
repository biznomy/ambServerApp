class AddVendorRefToAccounts < ActiveRecord::Migration
  def change
    add_reference :accounts, :vendor, index: true
  end
end
