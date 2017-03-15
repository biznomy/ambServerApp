class AddAdminRefToVendors < ActiveRecord::Migration
  def change
    add_reference :vendors, :admin, index: true
  end
end
