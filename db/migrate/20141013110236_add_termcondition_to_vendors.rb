class AddTermconditionToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :termcondition, :text
  end
end
