class AddPicPaperclip < ActiveRecord::Migration
  def change
  	add_column :userprofiles, :pic_file_name,    :string
    add_column :userprofiles, :pic_content_type, :string
    add_column :userprofiles, :pic_file_size,    :integer
    add_column :userprofiles, :pic_updated_at,   :datetime
  end
end
