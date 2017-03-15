class AddAdminToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :admin, :boolean
  end
end
