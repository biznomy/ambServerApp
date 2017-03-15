class Addon < Allcommon

 has_many :bookingaddons
 has_many :bookings, through: :bookingaddons
 has_many :vehicleaddons
 has_many :vehicles, through: :vehicleaddons	
	
 validates_presence_of :name 
	def self.search(query)
      where("name like ?", "%#{query}%") 
    end
    
  def self.list(params)
  	addons=Addon.all
  	return addons.page_config(params).pagesearch(params)
  end
end
