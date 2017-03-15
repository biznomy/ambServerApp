class RemoveFeedbackFromVendors < ActiveRecord::Migration
  def change
    remove_column :vendors, :feedback, :text
  end
end
