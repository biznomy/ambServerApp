class CreateAdminVendors < ActiveRecord::Migration
  def change
    create_table :admin_vendors do |t|
      t.string :name

      t.timestamps
    end
  end
end
