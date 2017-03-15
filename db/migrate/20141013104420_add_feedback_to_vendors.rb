class AddFeedbackToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :feedback, :text
  end
end
