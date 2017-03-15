class AddUserRefToUserprofiles < ActiveRecord::Migration
  def change
    add_reference :userprofiles, :user, index: true
  end
end
