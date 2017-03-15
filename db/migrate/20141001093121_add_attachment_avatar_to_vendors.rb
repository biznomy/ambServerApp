class AddAttachmentAvatarToVendors < ActiveRecord::Migration
  def self.up
    change_table :vendors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :vendors, :avatar
  end
end
