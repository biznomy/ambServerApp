class Vendor < Allcommon
	has_many :drivers, dependent: :destroy 
	has_many :vehicles, dependent: :destroy
	has_many :bookings, dependent: :destroy
	belongs_to :admin
	#validates_presence_of :name
   def self.search(query)
      where("name like ?", "%#{query}%") 
    end

    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ 

end
