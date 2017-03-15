class AddPriceToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :price, :float
  end
end
